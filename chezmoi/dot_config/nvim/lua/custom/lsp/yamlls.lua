--[[
Language server for YAML files.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("yaml-language-server") == 1 then
	lspconfig.yamlls.setup({
		capabilities = require("custom.util").capabilities(),
		settings = {
			yaml = {
				schemaStore = {
					enable = false,
					url = "",
				},
			},
		},
	})
end
