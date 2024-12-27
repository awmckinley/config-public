--[[
Elixir configuration.
--]]

require("custom.lsp.lexical")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				elixir = {
					"mix",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"elixir",
				"heex",
				"surface",
			})
		end,
	},
}
