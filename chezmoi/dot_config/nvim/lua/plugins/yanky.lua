--[[
Improved yank and put functions.

Similar:
- AckslD/nvim-neoclip.lua
- bfredl/nvim-miniyank
- bkoropoff/yankee.vim
- inkarkat/vim-UnconditionalPaste
- maxbrunsfeld/vim-yankstack
- svban/YankAssassin.vim
- svermeulen/vim-easyclip
- svermeulen/vim-yoink
--]]

return {

	{
		"gbprod/yanky.nvim",
		opts = {
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 250,
			},
			ring = {
				storage = "shada",
			},
		},
		event = {
			"BufNewFile",
			"BufReadPost",
			"BufWritePre",
		},
		keys = {
			{
				"<p",
				"<Plug>(YankyPutIndentAfterShiftLeft)",
				desc = "Put and indent left",
			},
			{
				"<P",
				"<Plug>(YankyPutIndentBeforeShiftLeft)",
				desc = "Put before and indent left",
			},
			{
				"=p",
				"<Plug>(YankyPutAfterFilter)",
				desc = "Put after applying a filter",
			},
			{
				"=P",
				"<Plug>(YankyPutBeforeFilter)",
				desc = "Put before applying a filter",
			},
			{
				">p",
				"<Plug>(YankyPutIndentAfterShiftRight)",
				desc = "Put and indent right",
			},
			{
				">P",
				"<Plug>(YankyPutIndentBeforeShiftRight)",
				desc = "Put before and indent right",
			},
			{
				"[p",
				"<Plug>(YankyPutIndentBeforeLinewise)",
				desc = "Put indented before cursor (linewise)",
			},
			{
				"[P",
				"<Plug>(YankyPutIndentBeforeLinewise)",
				desc = "Put indented before cursor (linewise)",
			},
			{
				"[y",
				"<Plug>(YankyCycleBackward)",
				desc = "Cycle backward through yank history",
			},
			{
				"]p",
				"<Plug>(YankyPutIndentAfterLinewise)",
				desc = "Put indented after cursor (linewise)",
			},
			{
				"]P",
				"<Plug>(YankyPutIndentAfterLinewise)",
				desc = "Put indented after cursor (linewise)",
			},
			{
				"]y",
				"<Plug>(YankyCycleForward)",
				desc = "Cycle forward through yank history",
			},
			{
				"gp",
				"<Plug>(YankyGPutAfter)",
				desc = "Put text after selection",
				mode = { "n", "x" },
			},
			{
				"gP",
				"<Plug>(YankyGPutBefore)",
				desc = "Put text before selection",
				mode = { "n", "x" },
			},
			{
				"p",
				"<Plug>(YankyPutAfter)",
				desc = "Put text after cursor",
				mode = { "n", "x" },
			},
			{
				"P",
				"<Plug>(YankyPutBefore)",
				desc = "Put text before cursor",
				mode = { "n", "x" },
			},
			{
				"y",
				"<Plug>(YankyYank)",
				desc = "Yank text",
				mode = { "n", "x" },
			},
			{
				"<Leader>fp",
				function()
					require("telescope").extensions.yank_history.yank_history({})
				end,
				desc = "Yank history",
			},
		},
		pin = true,
	},
}
