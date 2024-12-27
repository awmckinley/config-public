--[[
Java language server.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("jdtls") == 1 then
	lspconfig.jdtls.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
