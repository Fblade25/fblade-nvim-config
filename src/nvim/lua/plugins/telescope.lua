local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_config = {
			horizontal = { preview_width = 0.6 },
		},
		file_ignore_patterns = { "node_modules", ".git/" },
	},
})

-- Optional: Load extensions
-- telescope.load_extension("fzf")
