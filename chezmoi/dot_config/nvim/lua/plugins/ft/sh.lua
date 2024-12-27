--[[
Bash configuration.
--]]

require("custom.lsp.bashls")
local custom = require("custom.util")

custom.autocmd({ "FileType" }, {
	pattern = {
		"zsh",
	},
	callback = function()
		custom.source("sh")
	end,
})

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				sh = {
					"shellharden",
					"shfmt",
				},
				zsh = {
					"shellharden",
					"shfmt",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"bash",
			})
		end,
	},
}
