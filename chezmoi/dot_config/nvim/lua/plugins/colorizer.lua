--[[
NvChad fork of the fastest colorizer.

Similar:
- brenoprata10/nvim-highlight-colors
- RRethy/vim-hexokinase
--]]

local custom = require("custom.util")

return {
	{
		"NvChad/nvim-colorizer.lua",
		cond = not vim.g.vscode and custom.truecolor(),
		init = function()
			-- set before colorizer
			vim.opt.termguicolors = custom.truecolor()
		end,
		opts = {
			filetypes = {
				"*",
			},
		},
		pin = true,
	},
}
