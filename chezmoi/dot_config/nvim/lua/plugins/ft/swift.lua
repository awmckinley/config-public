--[[
Swift configuration.
--]]

local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				swift = {
					"swift_format",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"swift",
			})
		end,
	},
}
