--[[
Nix configuration.
--]]

require("custom.lsp.nil_ls")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				nix = {
					"nixfmt",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"nix",
			})
		end,
	},
}
