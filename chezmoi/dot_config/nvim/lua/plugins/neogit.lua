--[[
Interactive and powerful Git interface.

Similar:
- rbong/vim-flog
- tpope/vim-fugitive
--]]

return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			{ "nvim-lua/plenary.nvim", pin = true },
		},
		opts = function()
			local custom = require("custom.util")
			local opts = {
				graph_style = "ascii",
			}
			if custom.ansi256() then
				opts.graph_style = "unicode"
			end
			return opts
		end,
		cmd = {
			"Neogit",
		},
		keys = {
			{
				"<Leader>gg",
				"<Cmd>Neogit<CR>",
				desc = "Neogit",
			},
		},
		pin = true,
	},
}
