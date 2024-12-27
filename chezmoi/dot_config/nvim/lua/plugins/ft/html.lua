--[[
HTML configuration.
--]]

require("custom.lsp.emmet_language_server")
require("custom.lsp.harper_ls")
require("custom.lsp.superhtml")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				html = {
					"superhtml",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"html",
			})
		end,
	},

	{
		"stevearc/overseer.nvim",
		opts = function(_, opts)
			custom.list_extend_unique(opts.templates, {
				"user.browsersync",
			})
		end,
	},
}
