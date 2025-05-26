local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "

-- Open Telescope with Ctrl + P
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)

-- Open Telescope live_grep with Ctrl + [
map("n", "<C-f>", ":Telescope live_grep<CR>", opts)

-- File tree toggle
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Save
map("n", "<leader>w", ":w<CR>", opts)

-- Close buffer
map("n", "<leader>q", ":bd<CR>", opts)
