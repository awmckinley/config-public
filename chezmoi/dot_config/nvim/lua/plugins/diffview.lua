--[[
Easily cycle through diffs for all modified files for any git rev.
--]]

return {
	{
		"sindrets/diffview.nvim",
		dependencies = {
			{ "echasnovski/mini.icons", pin = true },
		},
		opts = {},
		cmd = {
			"DiffviewClose",
			"DiffviewFileHistory",
			"DiffviewFocusFiles",
			"DiffviewOpen",
			"DiffviewRefresh",
			"DiffviewToggleFiles",
		},
		keys = {
			{
				"<Leader>gd",
				"<Cmd>DiffviewOpen<CR>",
				desc = "Diffview",
			},
		},
		pin = true,
	},
}
