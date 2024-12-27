--[[
FZF sorter for Telescope.
--]]

return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim", pin = true },
		},
		opts = {
			extensions = {
				fzf = {
					case_mode = "smart_case",
					fuzzy = true,
					override_file_sorter = true,
					override_generic_sorter = true,
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzf")
		end,
		build = "make",
		pin = true,
	},
}
