--[[
Static type checker for Python.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("basedpyright") == 1 then
	lspconfig.basedpyright.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
