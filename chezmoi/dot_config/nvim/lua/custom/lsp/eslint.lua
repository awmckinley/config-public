--[[
Find and fix problems in your JavaScript code.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("vscode-eslint-language-server") == 1 then
	lspconfig.eslint.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
