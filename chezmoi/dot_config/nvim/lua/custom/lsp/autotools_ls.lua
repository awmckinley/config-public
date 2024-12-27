--[[
Autotools language server.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("autotools-language-server") == 1 then
	lspconfig.autotools_ls.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
