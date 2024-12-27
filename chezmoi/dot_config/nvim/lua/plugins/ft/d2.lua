--[[
D2 configuration.
--]]

local custom = require("custom.util")

vim.filetype.add({
	extension = {
		d2 = "d2",
	},
})

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				d2 = {
					"d2",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"d2",
			})
		end,
	},
}
