require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"python",
		"bash",
		"json",
		"yaml",
		"html",
		"css",
		"javascript",
		"tsx",
		"markdown",
		"markdown_inline",
	},
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	},
})
