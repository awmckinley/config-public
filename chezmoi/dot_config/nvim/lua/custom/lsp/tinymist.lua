--[[
Integrated language service for Typst.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("tinymist") == 1 then
	lspconfig.tinymist.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
