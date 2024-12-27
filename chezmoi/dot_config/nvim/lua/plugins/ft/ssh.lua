--[[
SSH configuration.
--]]

local custom = require("custom.util")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"ssh_config",
			})
		end,
	},
}
