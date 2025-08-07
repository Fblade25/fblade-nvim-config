local lspconfig = require("lspconfig")

-- UI settings (optional, for borders)
local _border = "rounded"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = _border })

-- Hover diagnostics
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]

-- Attach function (set keymaps, etc.)
local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Use `ruff` LSP directly
lspconfig.ruff.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		-- Optional: disable formatting from Ruff LSP, since we're using conform.nvim
		client.server_capabilities.documentFormattingProvider = false
	end,
})

-- Basedpyright setup
lspconfig.basedpyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				ruff = { enabled = true },
			},
		},
		basedpyright = {
			typeCheckingMode = "basic", -- or "strict"
		},
	},
})

-- Lua
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})
