--[[
Incremental analysis assistant for writing in Nix.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("nil") == 1 then
	lspconfig.nil_ls.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
