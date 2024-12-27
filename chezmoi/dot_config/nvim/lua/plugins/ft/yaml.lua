--[[
YAML configuration.
--]]

require("custom.lsp.yamlls")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				yaml = {
					"yamlfix",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"yaml",
			})
		end,
	},
}
