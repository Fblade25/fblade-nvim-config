-- ~/.config/nvim/lua/themes/crimson.lua

local M = {}

local c = {
	-- Main Colors
	red = "#e53935", -- A strong dark red
	red_light = "#f28b82", -- Light red for highlights or accents
	red_dark = "#b71c1c", -- Dark red for deep shadows or background
	crimson = "#d32f2f", -- Deep crimson red for main UI elements
	crimson_light = "#ef5350", -- Lighter crimson for softer accents
	crimson_dark = "#9a1e1e", -- Darker crimson for borders or dark backgrounds

	-- Accent Colors
	warm_red = "#f44336", -- A warm, vibrant red for active elements
	burnt_red = "#b53d44", -- Burnt red for emphasis on important parts
	dark_red = "#7f1f1f", -- Deep dark red for subtle highlights

	-- Background and Text Colors
	background = "#121212", -- Dark background, almost black
	text = "#f1f1f1", -- Off-white for text to contrast with the dark background
	comment = "#757575", -- Soft gray for comments and inactive text
	cursor = "#f1f1f1", -- White cursor for visibility
	selection = "#3a1a1a", -- Dark red selection for highlighting text

	-- Special Highlight Colors
	operator = "#ff7043", -- Warm accent color for operators (e.g., +, -, =)
	string = "#ffccbc", -- Light red-pink for string literals
	cfunction = "#ff8a65", -- Soft orange-red for functions or methods
}

local highlights = {
	-- UI Elements
	Normal = { fg = c.text, bg = c.background },
	NormalFloat = { fg = c.text, bg = c.background },
	EndOfBuffer = { fg = c.background, bg = c.background },
	LineNr = { fg = c.crimson_light, bg = c.background },
	LineNrAbove = { fg = c.crimson_light, bg = c.background },
	LineNrBelow = { fg = c.crimson_light, bg = c.background },
	SignColumn = { fg = c.crimson_light, bg = c.background },
	Cursor = { fg = c.text, bg = c.crimson_light },
	lCursor = { fg = c.text, bg = c.crimson_light },
	DiffAdd = { fg = c.text, bg = c.background },
	DiffChange = { fg = c.text, bg = c.background },
	DiffDelete = { fg = c.text, bg = c.background },
	DiffText = { fg = c.text, bg = c.background },
	ErrorMsg = { fg = c.crimson, bg = c.background },
	IncSearch = { fg = c.background, bg = c.crimson_light },
	Search = { fg = c.background, bg = c.crimson_light },
	Substitute = { fg = c.background, bg = c.crimson_light },
	Pmenu = { fg = c.text, bg = c.dark_red },
	PmenuSel = { fg = c.background, bg = c.crimson_dark },
	Whitespace = { fg = c.red_light, bg = c.background },

	-- Syntax highlighting with more red + red-orange tones
	Comment = { fg = c.comment, bg = c.background }, -- Comments in soft gray
	String = { fg = c.string, bg = c.background }, -- Strings in light red-pink
	Character = { fg = c.string, bg = c.background }, -- Characters in light red-pink
	Number = { fg = c.crimson_light, bg = c.background }, -- Numbers in warm red
	Float = { fg = c.crimson_light, bg = c.background }, -- Floats with warm reddish hue
	Boolean = { fg = c.crimson, bg = c.background }, -- Booleans in a deeper crimson

	Identifier = { fg = c.crimson_light, bg = c.background }, -- Identifiers in a softer red-orange
	Function = { fg = c.cfunction, bg = c.background }, -- Functions with soft orange-red color

	Statement = { fg = c.crimson, bg = c.background }, -- Keywords/statements (e.g. `if`, `else`)
	Operator = { fg = c.operator, bg = c.background }, -- Operators (e.g. `+`, `-`)
	PreProc = { fg = c.crimson, bg = c.background }, -- Preprocessor commands (e.g. `#include`)

	Type = { fg = c.crimson_light, bg = c.background }, -- Types in a light red-orange
	Special = { fg = c.string, bg = c.background }, -- Special elements in a soft orange
	Underlined = { fg = c.crimson_light, bg = c.background }, -- Underlined text with a lighter red

	Ignore = { fg = c.dark_red, bg = c.background }, -- Ignored elements in dark red
	Error = { fg = c.crimson, bg = c.background }, -- Error messages in deeper crimson
	Todo = { fg = c.crimson_light, bg = c.background }, -- Todo comments in a brighter red
}

M.colors = c

-- Set the theme highlights
M.setup = function()
	vim.cmd("hi clear")

	-- Apply highlights
	for group, opts in pairs(highlights) do
		vim.cmd(string.format("hi %s guifg=%s guibg=%s", group, opts.fg, opts.bg))
	end
end

return M
