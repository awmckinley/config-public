--[[
Show available keybindings in a popup as you type.

Similar:
- anuvyklack/hydra.nvim
- echasnovski/mini.clue
--]]

local custom = require("custom.util")

return {
	{
		"folke/which-key.nvim",
		dependencies = {
			{ "echasnovski/mini.icons", pin = true },
		},
		opts = {
			preset = "helix",
			delay = 0,
			spec = {
				{
					"[",
					group = "prev",
				},
				{
					"]",
					group = "next",
				},
				{
					"g",
					group = "goto",
				},
				{
					"gx",
					desc = "Open with system app",
					icon = {
						cat = "default",
						name = "os",
					},
				},
				{
					"z",
					group = "fold",
				},
				{
					"<Leader>a",
					group = "ai",
					mode = { "n", "v" },
				},
				{
					"<Leader>b",
					group = "buffers",
				},
				{
					"<Leader>c",
					group = "code",
					mode = { "n", "v" },
				},
				{
					"<Leader>d",
					group = "debug",
					mode = { "n", "v" },
				},
				{
					"<Leader>f",
					group = "find",
				},
				{
					"<Leader>g",
					group = "git",
					mode = { "n", "v" },
				},
				{
					"<Leader>gh",
					group = "hunks",
					mode = { "n", "v" },
				},
				{
					"<Leader>m",
					group = "marks",
					icon = {
						icon = "󰸕 ",
						color = "orange",
					},
				},
				{
					"<Leader>n",
					group = "notes",
					icon = {
						icon = "󰠮 ",
						color = "purple",
					},
				},
				{
					"<Leader>o",
					group = "overseer",
					icon = {
						icon = " ",
						color = "red",
					},
				},
				{
					"<leader>r",
					group = "refactor",
					icon = {
						icon = " ",
						color = "orange",
					},
					mode = { "n", "v" },
				},
				{
					"<Leader>s",
					group = "search",
					mode = { "n", "v" },
				},
				{
					"<Leader>t",
					group = "test",
				},
				{
					"<Leader>u",
					group = "ui",
				},
				{
					"<Leader>w",
					group = "windows",
					proxy = "<C-W>",
					expand = function()
						return require("which-key.extras").expand.win()
					end,
				},
				{
					"<Leader>x",
					group = "diagnostics",
				},
			},
			plugins = {
				spelling = {
					enabled = false,
				},
			},
			sort = {
				"order",
				"alphanum",
				"mod",
			},
			icons = {
				-- use icons when terminal supports it
				mappings = custom.truecolor(),
				-- tweak icon rules
				rules = {
					{
						plugin = "which-key.nvim",
						icon = "💥",
						color = "orange",
					},
				},
			},
		},
		config = function(_, opts)
			require("which-key").setup(opts)

			-- show global keys
			custom.user_command({
				name = "WhichKeyGlobal",
				desc = "Global keymaps",
				command = function()
					require("which-key").show({
						["local"] = false,
					})
				end,
			})

			-- show local keys
			custom.user_command({
				name = "WhichKeyLocal",
				desc = "Local keymaps",
				command = function()
					require("which-key").show({
						["global"] = false,
					})
				end,
			})
		end,
		event = {
			"VeryLazy",
		},
		cmd = {
			"WhichKeyGlobal",
			"WhichKeyLocal",
		},
		keys = {
			{
				"<C-W><Space>",
				function()
					require("which-key").show({
						keys = "<C-W>",
						loop = true,
					})
				end,
				desc = "Window hydra",
			},
			{
				"<Leader>?",
				"<Cmd>WhichKeyGlobal<CR>",
				desc = "Global keymaps",
			},
			{
				"<LocalLeader>?",
				"<Cmd>WhichKeyLocal<CR>",
				desc = "Buffer local keymaps",
			},
		},
		pin = true,
	},
}
