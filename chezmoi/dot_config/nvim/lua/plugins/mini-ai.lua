--[[
Extend and create `a`/`i` textobjects.

Similar:
- chrisgrieser/nvim-various-textobjs
- kana/vim-textobj-user
- wellle/targets.vim
--]]

return {
	{
		"echasnovski/mini.ai",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", pin = true },
			{ "nvim-treesitter/nvim-treesitter-textobjects", pin = true },
		},
		cond = true,
		opts = function()
			local spec_treesitter = require("mini.ai").gen_spec.treesitter
			return {
				custom_textobjects = {
					-- class definition
					C = spec_treesitter({
						a = "@class.outer",
						i = "@class.inner",
					}),
					-- function definition
					F = spec_treesitter({
						a = "@function.outer",
						i = "@function.inner",
					}),
					-- code block
					O = spec_treesitter({
						a = {
							"@block.outer",
							"@conditional.outer",
							"@loop.outer",
						},
						i = {
							"@block.inner",
							"@conditional.inner",
							"@loop.inner",
						},
					}),
				},
			}
		end,
		event = {
			"VeryLazy",
		},
		pin = true,
	},
}
