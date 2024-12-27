--[[
Lua configuration.
--]]

---@diagnostic disable: duplicate-set-field
---@diagnostic disable: undefined-field

require("custom.lsp.lua_ls")
local custom = require("custom.util")

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = {
					"stylua",
				},
			},
		},
	},

	{
		"folke/lazydev.nvim",
		dependencies = {
			{ "Bilal2453/luvit-meta", pin = true },
			{ "justinsgithub/wezterm-types", pin = true },
		},
		opts = {
			enabled = true,
			library = {
				{
					path = "luvit-meta/library",
					words = {
						"vim%.loop",
						"vim%.uv",
					},
				},
				{
					path = "wezterm-types",
					mods = {
						"wezterm",
					},
				},
			},
		},
		cmd = {
			"LazyDev",
		},
		ft = {
			"lua",
		},
		pin = true,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			custom.list_extend_unique(opts.ensure_installed, {
				"lua",
				"luadoc",
				"luap",
			})
		end,
	},

	{
		"jbyuki/one-small-step-for-vimkind",
		dependencies = {
			{ "mfussenegger/nvim-dap", pin = true },
		},
		init = function()
			if vim.env.NVIM_DEBUG then
				require("osv").launch({
					port = 8086,
					blocking = true,
				})
			end
		end,
		config = function()
			local dap = require("dap")

			dap.adapters.nlua = function(callback, config)
				local adapter = {
					type = "server",
					host = config.host or "127.0.0.1",
					port = config.port or 8086,
				}
				if config.start_neovim then
					local dap_run = dap.run
					dap.run = function(c)
						adapter.port = c.port
						adapter.host = c.host
					end
					require("osv").run_this()
					dap.run = dap_run
				end
				callback(adapter)
			end

			dap.configurations.lua = {
				{
					type = "nlua",
					request = "attach",
					name = "Run this file",
					start_neovim = {},
				},
				{
					type = "nlua",
					request = "attach",
					name = "Attach to running Neovim instance",
					port = 8086,
				},
			}
		end,
		keys = {
			{
				"<F5>",
				function()
					require("osv").launch({
						port = 8086,
					})
				end,
				desc = "Start debugger",
			},
		},
		pin = true,
	},
}
