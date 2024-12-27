--[[
Roslyn-based LSP language server for C#.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("csharp-ls") == 1 then
	lspconfig.csharp_ls.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
