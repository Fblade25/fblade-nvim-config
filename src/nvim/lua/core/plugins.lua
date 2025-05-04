require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("plugins.nvimtree")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		after = "mason.nvim", -- Ensure mason.nvim is loaded first
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" }, -- Automatically install Lua LSP
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("plugins.cmp")
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins.conform")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	},
	{ "lewis6991/gitsigns.nvim" },
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs")
		end,
	},
	{ "numToStr/Comment.nvim" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*",
				css = { names = true },
				lua = { rgb_fn = true, hsl_fn = true, css = true },
			})
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		config = function()
			require("ccc").setup({})
		end,
		cmd = { "CccPick", "CccConvert" },
		keys = {
			{ "<leader>cp", "<cmd>CccPick<CR>", desc = "Pick color" },
			{ "<leader>cc", "<cmd>CccConvert<CR>", desc = "Convert color" },
		},
	},
})
