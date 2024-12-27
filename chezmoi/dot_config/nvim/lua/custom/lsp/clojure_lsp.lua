--[[
Language Server for Clojure(script).
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("clojure-lsp") == 1 then
	lspconfig.clojure_lsp.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
