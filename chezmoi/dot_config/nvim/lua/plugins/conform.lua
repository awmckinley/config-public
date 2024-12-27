--[[
Lightweight yet powerful formatter plugin.

Similar:
- mhartington/formatter.nvim
- sbdchd/neoformat
--]]

local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		init = function()
			vim.opt.formatexpr = "v:lua.require('conform').formatexpr()"
		end,
		opts = {
			default_format_opts = {
				async = false,
				lsp_format = "fallback",
				quiet = false,
				timeout_ms = 3000,
			},
			format_on_save = {},
			formatters = {
				injected = {
					options = {
						ignore_errors = true,
					},
				},
			},
			formatters_by_ft = {
				["*"] = {
					"typos",
				},
				["_"] = {
					"trim_newlines",
					"trim_whitespace",
				},
			},
			notify_on_error = false,
		},
		config = function(_, opts)
			require("conform").setup(opts)

			custom.user_command({
				name = "ConformFormat",
				desc = "Format buffer",
				command = function()
					require("conform").format({
						async = true,
					})
				end,
			})

			custom.user_command({
				name = "ConformFormatInjected",
				desc = "Format injected",
				command = function()
					require("conform").format({
						formatters = {
							"injected",
						},
					})
				end,
			})
		end,
		event = {
			"BufWritePre",
		},
		cmd = {
			"ConformFormat",
			"ConformFormatInjected",
			"ConformInfo",
		},
		keys = {
			{
				"<Leader>cf",
				"<Cmd>ConformFormat<CR>",
				desc = "Format buffer",
			},
			{
				"<Leader>cF",
				"<Cmd>ConformFormatInjected<CR>",
				desc = "Format injected langs",
				mode = { "n", "v" },
			},
		},
		pin = true,
	},
}
