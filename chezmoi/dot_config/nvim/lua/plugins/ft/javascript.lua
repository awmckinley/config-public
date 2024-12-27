--[[
JavaScript configuration.
--]]

require("custom.dap.vscode_js_debug")
require("custom.lsp.biome")
require("custom.lsp.eslint")
require("custom.lsp.vtsls")
local custom = require("custom.util")

custom.autocmd({ "FileType" }, {
	pattern = {
		"typescript",
	},
	callback = function()
		custom.source("javascript")
	end,
})

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = {
					"biome",
				},
				typescript = {
					"biome",
				},
			},
		},
	},

	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = {
			{ "mfussenegger/nvim-dap", pin = true },
		},
		opts = {},
		pin = true,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"javascript",
				"jsdoc",
				"typescript",
			})
		end,
	},

	{
		"vuki656/package-info.nvim",
		opts = {},
		pin = true,
	},
}
