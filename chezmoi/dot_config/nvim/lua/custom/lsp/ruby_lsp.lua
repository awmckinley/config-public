--[[
Opinionated language server for Ruby.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("ruby-lsp") == 1 then
	lspconfig.ruby_lsp.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
