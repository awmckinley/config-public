--[[
JSON language server.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("vscode-json-language-server") == 1 then
	lspconfig.jsonls.setup({
		capabilities = require("custom.util").capabilities(),
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = {
					enable = true,
				},
			},
		},
	})
end
