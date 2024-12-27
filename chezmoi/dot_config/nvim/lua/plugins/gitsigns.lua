--[[
Git integration for buffers.

Similar:
- airblade/vim-gitgutter
- echasnovski/mini.diff
- mhinz/vim-signify
- neoclide/coc-git
--]]

return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		event = {
			"BufNewFile",
			"BufReadPost",
			"BufWritePre",
		},
		keys = {
			{
				"[h",
				function()
					if vim.wo.diff then
						vim.cmd.normal({
							"[c",
							bang = true,
						})
					else
						require("gitsigns").nav_hunk("prev", {
							target = "all",
						})
					end
				end,
				desc = "Prev hunk",
			},
			{
				"[H",
				"<Cmd>Gitsigns nav_hunk first target=all<CR>",
				desc = "First hunk",
			},
			{
				"]h",
				function()
					if vim.wo.diff then
						vim.cmd.normal({
							"]c",
							bang = true,
						})
					else
						require("gitsigns").nav_hunk("next", {
							target = "all",
						})
					end
				end,
				desc = "Next hunk",
			},
			{
				"]H",
				"<Cmd>Gitsigns nav_hunk last target=all<CR>",
				desc = "Last hunk",
			},
			{
				"<Leader>ghb",
				"<Cmd>Gitsigns blame_line full=true<CR>",
				desc = "Blame line",
			},
			{
				"<Leader>ghB",
				"<Cmd>Gitsigns blame<CR>",
				desc = "Blame buffer",
			},
			{
				"<Leader>ghd",
				"<Cmd>Gitsigns diffthis<CR>",
				desc = "Diff this",
			},
			{
				"<Leader>ghD",
				"<Cmd>Gitsigns diffthis ~<CR>",
				desc = "Diff this ~",
			},
			{
				"<Leader>ghp",
				"<Cmd>Gitsigns preview_hunk_inline<CR>",
				desc = "Preview hunk inline",
			},
			{
				"<Leader>ghr",
				"<Cmd>Gitsigns reset_hunk<CR>",
				desc = "Reset hunk",
				mode = { "n", "v" },
			},
			{
				"<Leader>ghR",
				"<Cmd>Gitsigns reset_buffer<CR>",
				desc = "Reset buffer",
			},
			{
				"<Leader>ghs",
				"<Cmd>Gitsigns stage_hunk<CR>",
				desc = "Stage hunk",
				mode = { "n", "v" },
			},
			{
				"<Leader>ghS",
				"<Cmd>Gitsigns stage_buffer<CR>",
				desc = "Stage buffer",
			},
			{
				"<Leader>ghu",
				"<Cmd>Gitsigns undo_stage_hunk<CR>",
				desc = "Undo stage hunk",
			},
		},
		pin = true,
	},
}
