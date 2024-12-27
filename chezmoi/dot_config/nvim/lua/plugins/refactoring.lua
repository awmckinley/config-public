--[[
Refactoring library based off the Refactoring book by Martin Fowler.
--]]

local custom = require("custom.util")

return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", pin = true },
			{ "nvim-treesitter/nvim-treesitter", pin = true },
		},
		opts = {},
		config = function(_, opts)
			local refactoring = require("refactoring")
			refactoring.setup(opts)

			custom.user_command({
				name = "RefactoringExtractVariable",
				desc = "Extract variable",
				command = function()
					refactoring.refactor("Extract Variable")
				end,
			})
		end,
		event = {
			"BufNewFile",
			"BufReadPre",
		},
		cmd = {
			"RefactoringExtractVariable",
		},
		keys = {
			{
				"<Leader>rx",
				"<Cmd>RefactoringExtractVariable<CR>",
				desc = "Extract variable",
				mode = { "v" },
			},
		},
		pin = true,
	},
}
