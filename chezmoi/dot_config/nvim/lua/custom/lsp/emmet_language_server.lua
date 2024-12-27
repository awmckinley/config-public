--[[
Language server for emmet.io.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("emmet-language-server") == 1 then
	lspconfig.emmet_language_server.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
