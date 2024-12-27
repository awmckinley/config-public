--[[
Kotlin configuration.
--]]

require("custom.lsp.kotlin_language_server")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				kotlin = {
					"ktfmt",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"kotlin",
			})
		end,
	},
}
