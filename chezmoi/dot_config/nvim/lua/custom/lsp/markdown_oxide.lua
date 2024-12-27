--[[
PKM for the LSP.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("markdown-oxide") == 1 then
	lspconfig.markdown_oxide.setup({
		capabilities = vim.tbl_deep_extend("force", require("custom.util").capabilities(), {
			workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = true,
				},
			},
		}),
	})
end
