--[[
Getting you where you want with the fewest keystrokes.

Similar:
- cbochs/grapple.nvim
--]]

return {
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			{ "nvim-lua/plenary.nvim", pin = true },
		},
		opts = {
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = false,
			},
		},
		keys = {
			{
				"<Leader>mh",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Add to Harpoon",
			},
			{
				"<M-d>",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Open Harpoon list",
			},
			{
				"<M-h>",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Select Harpoon mark 1",
			},
			{
				"<M-t>",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Select Harpoon mark 2",
			},
			{
				"<M-n>",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Select Harpoon mark 3",
			},
			{
				"<M-s>",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Select Harpoon mark 4",
			},
		},
		branch = "harpoon2",
		pin = true,
	},
}
