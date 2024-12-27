--[[
Git configuration.
--]]

local custom = require("custom.util")

custom.autocmd({ "FileType" }, {
	pattern = {
		"NeogitCommitMessage",
	},
	callback = function()
		custom.source("gitcommit")
	end,
})

custom.autocmd({ "FileType" }, {
	pattern = {
		"NeogitDiffView",
		"NeogitStatus",
	},
	callback = function()
		vim.opt_local.tabstop = 4
	end,
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
			})
		end,
	},
}
