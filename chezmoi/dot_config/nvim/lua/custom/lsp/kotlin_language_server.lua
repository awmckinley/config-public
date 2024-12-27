--[[
Kotlin code completion, diagnostics and more.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("kotlin-language-server") == 1 then
	lspconfig.kotlin_language_server.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
