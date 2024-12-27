--[[
Smart and powerful commenting.

Neovim now has built-in comment commands, like `gc`. `Comment.nvim` implements
some motions that are not built-in to Neovim, such as `gcw`.

Similar:
- b3nj5m1n/kommentary
- echasnovski/mini.comment
- preservim/nerdcommenter
- terrortylor/nvim-comment
- tomtom/tcomment_vim
- tpope/vim-commentary
--]]

return {
	{
		"numToStr/Comment.nvim",
		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring", pin = true },
		},
		opts = function()
			return {
				toggler = {
					line = "gcc",
					block = "gbc",
				},
				opleader = {
					line = "gc",
					block = "gb",
				},
				extra = {
					above = "gcO",
					below = "gco",
					eol = "gcA",
				},
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
		pin = true,
	},
}
