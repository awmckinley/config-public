--[[
Language server that offers Lua language support.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("lua-language-server") == 1 then
	lspconfig.lua_ls.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
