--[[
XML language server.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("lemminx") == 1 then
	lspconfig.lemminx.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
