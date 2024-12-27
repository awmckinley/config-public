--[[
Next-generation Elixir language server.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("lexical") == 1 then
	lspconfig.lexical.setup({
		capabilities = require("custom.util").capabilities(),
		cmd = {
			"lexical",
		},
	})
end
