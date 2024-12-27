--[[
PHP configuration.
--]]

require("custom.lsp.intelephense")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				php = {
					"php_cs_fixer",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"php",
			})
		end,
	},
}
