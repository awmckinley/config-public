--[[
Nix configuration.
--]]

require("custom.lsp.ocamllsp")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				ocaml = {
					"ocamlformat",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"ocaml",
				"ocaml_interface",
			})
		end,
	},
}
