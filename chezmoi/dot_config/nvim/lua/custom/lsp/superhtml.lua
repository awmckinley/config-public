--[[
HTML language server and templating language library.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("superhtml") == 1 then
	lspconfig.superhtml.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
