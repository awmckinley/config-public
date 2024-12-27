--[[
Undo history visualizer.

Similar:
- mbbill/undotree
- simnalamburt/vim-mundo
- sjl/gundo.vim
--]]

return {
	{
		"debugloop/telescope-undo.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim", pin = true },
		},
		opts = {
			extensions = {
				undo = {
					side_by_side = true,
					layout_strategy = "vertical",
					layout_config = {
						preview_height = 0.8,
					},
				},
			},
		},
		config = function(_, opts)
			-- ok to call telescope setup multiple times
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("undo")
		end,
		keys = {
			{
				"<Leader>fu",
				"<Cmd>Telescope undo<CR>",
				desc = "Undo history",
			},
		},
		pin = true,
	},
}
