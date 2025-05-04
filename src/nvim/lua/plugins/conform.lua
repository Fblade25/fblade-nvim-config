require("conform").setup({
	formatters = {
		ruff_format = {
			command = "ruff",
			args = { "format", "-" },
			stdin = true,
		},
	},
	formatters_by_ft = {
		python = { "ruff_format" },
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = false,
	},
})
