--[[
Distraction-free coding.

Similar:
- pocco81/true-zen.nvim
- Snikimonkd/yazmp
--]]

return {
	{
		"folke/zen-mode.nvim",
		dependencies = {
			{ "folke/twilight.nvim", pin = true },
		},
		opts = {
			window = {
				backdrop = 0.7,
				width = 80,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = true,
					list = false,
				},
			},
			plugins = {
				gitsigns = {
					enabled = false,
				},
				tmux = {
					enabled = vim.env.TMUX ~= nil,
				},
				wezterm = {
					enabled = true,
					font = "+2",
				},
			},
		},
		cmd = {
			"ZenMode",
		},
		keys = {
			{
				"<Leader>uz",
				"<Cmd>ZenMode<CR>",
				desc = "Zen mode",
			},
		},
		pin = true,
	},
}
