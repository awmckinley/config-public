--[[
Show code context.

Similar:
- SmiteshP/nvim-navic
- wellle/context.vim
--]]

return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 6,
			mode = "topline",
			separator = nil,
		},
		lazy = false,
		cmd = {
			"TSContextDisable",
			"TSContextEnable",
			"TSContextToggle",
		},
		pin = true,
	},
}
