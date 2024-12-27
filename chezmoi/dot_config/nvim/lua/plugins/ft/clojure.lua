--[[
Clojure configuration.
--]]

require("custom.lsp.clojure_lsp")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				clojure = {
					"cljfmt",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"clojure",
			})
		end,
	},
}
