--[[
Versatile, feature-rich TOML toolkit.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("taplo") == 1 then
	lspconfig.taplo.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
