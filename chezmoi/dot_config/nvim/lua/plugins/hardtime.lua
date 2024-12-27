--[[
Establish good command workflow and quit bad habits.
--]]

return {
	{
		"m4xshen/hardtime.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim", pin = true },
			{ "nvim-lua/plenary.nvim", pin = true },
		},
		cond = false, -- enable if bad habits return
		opts = {
			-- allow the mouse
			disable_mouse = false,
			-- keys should still work
			restriction_mode = "hint",
			-- not editing code/prose
			disabled_filetypes = {
				"lazy",
				"mason",
				"netrw",
				"NvimTree",
				"oil",
				"qf",
			},
			-- tweak hints
			hints = {
				["[kj][%^_]"] = {
					-- oil uses `-` so remove this hint
				},
			},
		},
		pin = true,
	},
}
