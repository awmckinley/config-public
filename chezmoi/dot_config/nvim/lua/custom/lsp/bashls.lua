--[[
Language server for Bash.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("bash-language-server") == 1 then
	lspconfig.bashls.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
