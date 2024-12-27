--[[
Python configuration.
--]]

require("custom.lsp.basedpyright")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = {
					"ruff_fix",
					"ruff_format",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"python",
			})
		end,
	},

	{
		"stevearc/overseer.nvim",
		opts = function(_, opts)
			custom.list_extend_unique(opts.templates, {
				"user.python",
			})
		end,
	},
}
