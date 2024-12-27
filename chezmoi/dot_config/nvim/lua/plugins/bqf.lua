--[[
Better quickfix window.

Similar:
- stevearc/quicker.nvim
- yorickpeterse/nvim-pqf
--]]

return {
	{
		"kevinhwang91/nvim-bqf",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", pin = true },
		},
		ft = {
			"qf",
		},
		keys = {
			{
				"[q",
				"<Cmd>cprev<CR>",
				desc = "Previous Quickfix item",
			},
			{
				"]q",
				"<Cmd>cnext<CR>",
				desc = "Next Quickfix item",
			},
			{
				"<Leader>xq",
				"<Cmd>copen<CR>",
				desc = "Quickfix",
			},
		},
		pin = true,
	},
}
