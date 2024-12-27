--[[
Rust configuration.
--]]

local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				rust = {
					"rustfmt",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"rust",
			})
		end,
	},

	{
		"mrcjkb/rustaceanvim",
		dependencies = {
			{ "mfussenegger/nvim-dap", pin = true },
			{ "nvim-treesitter/nvim-treesitter", pin = true },
		},
		init = function()
			vim.g.rustaceanvim = {}
		end,
		ft = { "rust" },
		version = "^5",
		pin = true,
	},
}
