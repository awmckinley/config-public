--[[
Highly extendable fuzzy finder over lists.

Similar:
- junegunn/fzf.vim
- liuchengxu/vim-clap
- Shougo/denite.nvim
- Yggdroot/LeaderF
--]]

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "echasnovski/mini.icons", pin = true },
			{ "nvim-lua/plenary.nvim", pin = true },
			{ "nvim-treesitter/nvim-treesitter", pin = true },
		},
		init = function()
			local custom = require("custom.util")
			custom.autocmd("User", {
				pattern = "TelescopePreviewerLoaded",
				callback = function()
					custom.indent_with_tabs(4)
				end,
			})
		end,
		opts = function()
			return {
				defaults = require("telescope.themes").get_ivy({
					mappings = {
						n = {
							["<C-C>"] = "close",
						},
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
				}),
				pickers = {
					find_files = {
						find_command = {
							"fd",
							"--strip-cwd-prefix",
							"--type=f",
							"--exclude=.git",
						},
						hidden = true,
					},
				},
			}
		end,
		cmd = {
			"Telescope",
		},
		keys = {
			{
				"<Leader>fb",
				"<Cmd>Telescope buffers sort_mru=true sort_lastused=true<CR>",
				desc = "Find buffers",
			},
			{
				"<Leader>ff",
				"<Cmd>Telescope find_files<CR>",
				desc = "Find files",
			},
			{
				"<Leader>fr",
				"<Cmd>Telescope oldfiles<CR>",
				desc = "Recent files",
			},
			{
				"<Leader>sb",
				"<Cmd>Telescope current_buffer_fuzzy_find fuzzy=false<CR>",
				desc = "Search in buffer",
			},
			{
				"<Leader>sg",
				"<Cmd>Telescope live_grep<CR>",
				desc = "Grep files",
			},
			{
				"<Leader>sh",
				"<Cmd>Telescope help_tags<CR>",
				desc = "Help pages",
			},
			{
				"<Leader>ss",
				"<Cmd>Telescope lsp_document_symbols<CR>",
				desc = "Goto symbol",
			},
		},
		pin = true,
	},
}
