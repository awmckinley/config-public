--[[
Render diagnostics using virtual lines.
--]]

local custom = require("custom.util")

return {
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()

			-- enable by default
			vim.diagnostic.config({
				virtual_lines = true,
				virtual_text = false,
			})

			custom.user_command({
				name = "LspLinesToggle",
				desc = "Toggle lsp_lines",
				command = function()
					local config = vim.diagnostic.config() or {}
					if config.virtual_text then
						vim.diagnostic.config({
							virtual_lines = true,
							virtual_text = false,
						})
					else
						vim.diagnostic.config({
							virtual_lines = false,
							virtual_text = true,
						})
					end
				end,
			})
		end,
		keys = {
			{
				"<Leader>ul",
				"<Cmd>LspLinesToggle<CR>",
				desc = "LSP lines",
			},
		},
		lazy = false,
		pin = true,
	},
}
