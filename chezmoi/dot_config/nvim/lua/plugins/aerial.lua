--[[
Code outline sidebar.

Similar:
- hedyhli/outline.nvim
- liuchengxu/vista.vim
- simrat39/symbols-outline.nvim
--]]

local custom = require("custom.util")

return {
	{
		"stevearc/aerial.nvim",
		dependencies = {
			{ "echasnovski/mini.icons", pin = true },
			{ "nvim-treesitter/nvim-treesitter", pin = true },
		},
		opts = {
			attach_mode = "global",
			highlight_on_hover = true,
			layout = {
				default_direction = "prefer_left",
				max_width = {
					80,
					0.2,
				},
			},
			link_folds_to_tree = true,
			link_tree_to_folds = true,
			show_guides = true,
		},
		config = function(_, opts)
			local aerial = require("aerial")
			aerial.setup(opts)

			custom.user_command({
				name = "AerialNextUp",
				desc = "Next Aerial parent symbol",
				command = function()
					aerial.next_up()
				end,
			})

			custom.user_command({
				name = "AerialPrevUp",
				desc = "Previous Aerial parent symbol",
				command = function()
					aerial.prev_up()
				end,
			})
		end,
		cmd = {
			"AerialClose",
			"AerialCloseAll",
			"AerialGo",
			"AerialInfo",
			"AerialNavClose",
			"AerialNavOpen",
			"AerialNavToggle",
			"AerialNext",
			"AerialNextUp",
			"AerialOpen",
			"AerialOpenAll",
			"AerialPrev",
			"AerialPrevUp",
			"AerialToggle",
		},
		keys = {
			{
				"[s",
				"<Cmd>AerialPrev<CR>",
				desc = "Previous Aerial symbol",
				mode = { "n", "v" },
			},
			{
				"[u",
				"<Cmd>AerialPrevUp<CR>",
				desc = "Previous Aerial parent symbol",
				mode = { "n", "v" },
			},
			{
				"]s",
				"<Cmd>AerialNext<CR>",
				desc = "Next Aerial symbol",
				mode = { "n", "v" },
			},
			{
				"]u",
				"<Cmd>AerialNextUp<CR>",
				desc = "Next Aerial parent symbol",
				mode = { "n", "v" },
			},
			{
				"<Leader>us",
				"<Cmd>AerialToggle!<CR>",
				desc = "Aerial",
				mode = { "n" },
			},
			{
				"<Leader>uS",
				"<Cmd>AerialNavToggle<CR>",
				desc = "Aerial nav",
				mode = { "n" },
			},
		},
		pin = true,
	},
}
