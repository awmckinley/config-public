--[[
Professional PHP tooling.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("intelephense") == 1 then
	lspconfig.intelephense.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
