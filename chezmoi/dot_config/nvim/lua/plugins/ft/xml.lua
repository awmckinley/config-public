--[[
XML configuration.
--]]

require("custom.lsp.lemminx")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				xml = {
					"xmllint",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"xml",
			})
		end,
	},
}
