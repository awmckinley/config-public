--[[
Automatically highlight other uses of the word under the cursor.
--]]

return {
	{
		"RRethy/vim-illuminate",
		opts = {
			delay = 200,
			filetypes_denylist = {
				"NeogitStatus",
				"NvimTree",
				"lazy",
				"netrw",
				"oil",
				"qf",
			},
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = {
					"lsp",
				},
			},
			modes_allowlist = {
				"n",
			},
			providers = {
				"lsp",
				"treesitter",
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
		event = {
			"BufNewFile",
			"BufReadPost",
			"BufWritePre",
		},
		keys = {
			{
				"[[",
				function()
					require("illuminate").goto_prev_reference(false)
				end,
				desc = "Prev reference",
			},
			{
				"]]",
				function()
					require("illuminate").goto_next_reference(false)
				end,
				desc = "Next reference",
			},
		},
		pin = true,
	},
}
