--[[
LSP wrapper around TypeScript extension bundled with VSCode.
--]]

local ok, lspconfig = pcall(require, "lspconfig")

if ok and vim.fn.executable("vtsls") == 1 then
	lspconfig.vtsls.setup({
		capabilities = require("custom.util").capabilities(),
	})
end

-- NOTE: remove when vtsls is available in Nix
-- https://github.com/NixOS/nixpkgs/pull/319501
if ok and vim.fn.executable("typescript-language-server") == 1 then
	lspconfig.ts_ls.setup({
		capabilities = require("custom.util").capabilities(),
	})
end
