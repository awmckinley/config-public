--[[
Language Server Protocol frontend for Harper.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("harper-ls") == 1 then
	lspconfig.harper_ls.setup({
		capabilities = require("custom.util").capabilities(),
		settings = {
			["harper-ls"] = {
				linters = {
					spell_check = false,
					sentence_capitalization = false,
				},
			},
		},
	})
end
