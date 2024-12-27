--[[
Markdown configuration.

Related:
- iamcco/markdown-preview.nvim
- MeanderingProgrammer/render-markdown.nvim
- OXY2DEV/markview.nvim
- preservim/vim-markdown
--]]

require("custom.lsp.markdown_oxide")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				markdown = {
					"mdformat",
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"latex",
				"markdown",
				"markdown_inline",
			})
		end,
	},
}
