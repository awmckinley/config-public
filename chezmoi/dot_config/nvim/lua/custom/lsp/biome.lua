--[[
Toolchain of the web.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("biome") == 1 then
	lspconfig.biome.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
