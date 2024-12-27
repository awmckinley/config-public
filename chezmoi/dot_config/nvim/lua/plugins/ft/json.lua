--[[
JSON configuration.
--]]

require("custom.lsp.biome")
require("custom.lsp.jsonls")
local custom = require("custom.util")

custom.autocmd({ "FileType" }, {
	pattern = {
		"jsonc",
	},
	callback = function()
		custom.source("json")
	end,
})

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formattters = {
				prettierd = {
					require_cwd = true,
				},
			},
			formatters_by_ft = {
				json = {
					"biome",
					"prettierd",
				},
				jsonc = {
					"biome",
					"prettierd",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"json",
				"jsonc",
			})
		end,
	},
}
