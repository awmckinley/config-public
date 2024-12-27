--[[
Task runner and job management.

Similar:
- skywind3000/asyncrun.vim
--]]

return {
	{
		"stevearc/overseer.nvim",
		opts = {
			strategy = {
				"jobstart",
			},
			templates = {
				"builtin",
			},
		},
		cmd = {
			"OverseerDebugParser",
			"OverseerInfo",
			"OverseerLoadBundle",
			"OverseerOpen",
			"OverseerQuickAction",
			"OverseerRun",
			"OverseerRunCmd",
			"OverseerTaskAction",
			"OverseerToggle",
		},
		keys = {
			{
				"<Leader>oc",
				"<Cmd>OverseerRunCmd<CR>",
				desc = "Run command",
				mode = { "n" },
			},
			{
				"<Leader>od",
				"<Cmd>OverseerQuickAction<CR>",
				desc = "Quick action",
				mode = { "n" },
			},
			{
				"<Leader>ol",
				"<Cmd>OverseerLoadBundle<CR>",
				desc = "Load",
				mode = { "n" },
			},
			{
				"<Leader>oo",
				"<Cmd>OverseerToggle!<CR>",
				desc = "Open",
				mode = { "n" },
			},
			{
				"<Leader>or",
				"<Cmd>OverseerRun<CR>",
				desc = "Run",
				mode = { "n" },
			},
			{
				"<Leader>os",
				"<Cmd>OverseerTaskAction<CR>",
				desc = "Task action",
				mode = { "n" },
			},
		},
		pin = true,
	},
}
