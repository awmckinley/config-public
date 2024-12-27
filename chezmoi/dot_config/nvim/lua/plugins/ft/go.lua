--[[
Go configuration.
--]]

require("custom.lsp.gopls")
local custom = require("custom.util")

custom.autocmd({ "FileType" }, {
	pattern = {
		"gomod",
		"gotmpl",
		"gowork",
	},
	callback = function()
		custom.source("go")
	end,
})

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				go = {
					"goimports",
					"gofumpt",
				},
			},
		},
	},

	{
		"leoluz/nvim-dap-go",
		opts = {},
		pin = true,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"go",
				"gomod",
				"gosum",
				"gotmpl",
				"gowork",
			})
		end,
	},
}
