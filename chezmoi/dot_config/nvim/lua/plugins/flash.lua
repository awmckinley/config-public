--[[
Navigate your code.

Similar:
- echasnovski/mini.jump
- echasnovski/mini.jump2d
- ggandor/flit.nvim
- ggandor/leap.nvim
- ggandor/lightspeed.nvim
- mfussenegger/nvim-treehopper
- rlane/pounce.nvim
- smoka7/hop.nvim
- woosaaahh/sj.nvim
--]]

return {
	{
		"folke/flash.nvim",
		---@type Flash.Config
		opts = {
			labels = "aoeuidhtnspyfgcrlqjkxbmwvz",
			modes = {
				char = {
					-- retain vim behavior
					multi_line = false,
					-- no dimming
					highlight = {
						backdrop = false,
					},
				},
			},
		},
		event = {
			"VeryLazy",
		},
		keys = {
			{
				"r",
				function()
					require("flash").remote()
				end,
				desc = "Remote flash",
				mode = { "o" },
			},
			{
				"R",
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter search",
				mode = { "o", "x" },
			},
			{
				"s",
				function()
					require("flash").jump()
				end,
				desc = "Flash",
				mode = { "n", "x", "o" },
			},
			{
				"S",
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
				mode = { "n", "x", "o" },
			},
			{
				"<C-S>",
				function()
					require("flash").toggle()
				end,
				desc = "Toggle flash search",
				mode = { "c" },
			},
		},
		pin = true,
	},
}
