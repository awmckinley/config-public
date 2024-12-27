--[[
Typst configuration.
--]]

require("custom.lsp.tinymist")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				typst = {
					"typstyle",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"typst",
			})
		end,
	},
}
