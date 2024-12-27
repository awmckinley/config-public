--[[
Make configuration.
--]]

require("custom.lsp.autotools_ls")
local custom = require("custom.util")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"make",
			})
		end,
	},
}
