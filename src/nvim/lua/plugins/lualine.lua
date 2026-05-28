require("lualine").setup({
	options = {
		theme = {
			normal = { c = { fg = "#f8f8f2", bg = "#1e1e1e" } },
			insert = { c = { fg = "#f8f8f2", bg = "#42a5f5" } },
			command = { c = { fg = "#f8f8f2", bg = "#81c784" } },
		},
		section_separators = "",
		component_separators = "|",
		icons_enabled = true,
	},
	sections = {
		lualine_a = { "mode" },
        lualine_b = {
            {
                "branch",
                fmt = function(str)
                    if #str > 12 then
                        return str:sub(1, 12) .. "…"
                    end
                    return str
                end,
            },
            "diff",
            "diagnostics",
        },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
