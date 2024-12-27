--[[
C# configuration.
--]]

require("custom.lsp.csharp_ls")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				csharpier = {
					command = "dotnet-csharpier",
					args = {
						"--write-stdout",
					},
				},
			},
			formatters_by_ft = {
				cs = {
					"csharpier",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"c_sharp",
			})
		end,
	},
}
