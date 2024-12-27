--[[
LSP server for OCaml.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("ocamllsp") == 1 then
	lspconfig.ocamllsp.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
