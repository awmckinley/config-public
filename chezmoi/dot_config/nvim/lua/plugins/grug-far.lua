--[[
Find and replace.
--]]

return {
	{
		"MagicDuck/grug-far.nvim",
		opts = {
			headerMaxWidth = 80,
		},
		cmd = {
			"GrugFar",
		},
		keys = {
			{
				"<Leader>sr",
				"<Cmd>GrugFar<CR>",
				desc = "Search and replace",
				mode = { "n", "v" },
			},
		},
		pin = true,
	},
}
