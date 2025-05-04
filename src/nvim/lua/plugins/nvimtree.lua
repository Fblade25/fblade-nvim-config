require("nvim-tree").setup({
	view = {
		width = 30,
		side = "left",
		number = false,
		relativenumber = false,
	},
	filters = {
		dotfiles = false,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
		},
	},
})
