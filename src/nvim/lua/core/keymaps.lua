local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "


local telescope_builtin = require("telescope.builtin")
local is_tmux_zoomed = false

local function toggle_tmux_fullscreen()
  if vim.env.TMUX then
    vim.fn.system("tmux resize-pane -Z")
    is_tmux_zoomed = not is_tmux_zoomed
  end
end

local function telescope_with_tmux_fullscreen(picker)
  return function()
    if not is_tmux_zoomed then
      toggle_tmux_fullscreen() -- zoom in on open
    end

    telescope_builtin[picker]({
      attach_mappings = function(prompt_bufnr, map)
        vim.api.nvim_create_autocmd({"BufWipeout", "BufUnload"}, {
          buffer = prompt_bufnr,
          once = true,
          callback = function()
            if is_tmux_zoomed then
              toggle_tmux_fullscreen() -- zoom out on close
            end
          end,
        })
        return true
      end,
    })
  end
end

-- Bind Ctrl+p to find_files with zoom toggle
map("n", "<C-p>", telescope_with_tmux_fullscreen("find_files"), opts)

-- Bind Ctrl+f to live_grep with zoom toggle
map("n", "<C-f>", telescope_with_tmux_fullscreen("live_grep"), opts)

-- File tree toggle
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Save
map("n", "<leader>w", ":w<CR>", opts)

-- Close buffer
map("n", "<leader>q", ":bd<CR>", opts)

