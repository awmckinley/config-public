--[[
LSP client.
--]]

local custom = require("custom.util")

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "b0o/SchemaStore.nvim", pin = true },
			{ "hrsh7th/cmp-nvim-lsp", pin = true },
			{ "smjonas/inc-rename.nvim", pin = true },
		},
		config = function()
			-- triggered on lsp attach
			custom.autocmd("LspAttach", {
				callback = function()
					local telescope = require("telescope.builtin")

					-- enable completion triggered by <C-X><C-O>
					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

					vim.keymap.set("n", "gd", telescope.lsp_definitions, {
						buffer = 0,
						desc = "Goto definition",
					})

					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
						buffer = 0,
						desc = "Goto declaration",
					})

					vim.keymap.set("n", "gI", telescope.lsp_implementations, {
						buffer = 0,
						desc = "Goto implementation",
					})

					vim.keymap.set("n", "gr", telescope.lsp_references, {
						buffer = 0,
						desc = "Goto references",
					})

					vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {
						buffer = 0,
						desc = "Goto type definition",
					})

					vim.keymap.set("n", "gy", telescope.lsp_type_definitions, {
						buffer = 0,
						desc = "Goto type definition",
					})

					vim.keymap.set("n", "K", vim.lsp.buf.hover, {
						buffer = 0,
						desc = "Hover definition",
					})

					vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {
						buffer = 0,
						desc = "Code actions",
					})

					vim.keymap.set("n", "<Leader>cr", function()
						return ":IncRename " .. vim.fn.expand("<cword>")
					end, {
						buffer = 0,
						desc = "Rename symbol",
						expr = true,
					})

					local clients = vim.lsp.get_clients()
					for _, client in ipairs(clients) do
						if client.server_capabilities.codeLensProvider then
							vim.b.refresh_codelens = true
						end

						if client.name == "markdown_oxide" then
							custom.user_command({
								name = "OxideDaily",
								desc = "Open daily note",
								nargs = "*",
								command = function(args)
									local input = args.args
									vim.lsp.buf.execute_command({
										command = "jump",
										arguments = { input },
									})
								end,
							})
						end
					end

					custom.autocmd({
						"BufEnter",
						"CursorHold",
						"InsertLeave",
						"TextChanged",
					}, {
						buffer = 0,
						callback = function()
							if vim.b.refresh_codelens then
								vim.lsp.codelens.refresh({ bufnr = 0 })
							end
						end,
					})
				end,
			})
		end,
		event = {
			"BufNewFile",
			"BufReadPost",
			"BufWritePre",
		},
		cmd = {
			"LspInfo",
			"LspLog",
			"LspRestart",
			"LspStart",
			"LspStop",
		},
		pin = true,
	},
}
