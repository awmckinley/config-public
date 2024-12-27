--[[
Highlight, list and search todo comments in your projects.
--]]

return {
	{
		"folke/todo-comments.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", pin = true },
		},
		opts = {
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--hidden",
				},
			},
		},
		lazy = false,
		cmd = {
			"TodoLocList",
			"TodoQuickFix",
			"TodoTelescope",
			"TodoTrouble",
		},
		keys = {
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous Todo comment",
			},
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next Todo comment",
			},
			{
				"<Leader>ft",
				"<Cmd>TodoTelescope<CR>",
				desc = "Todo comments",
			},
		},
		pin = true,
	},
}
