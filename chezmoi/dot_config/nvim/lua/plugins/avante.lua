--[[
Like using Cursor AI IDE!
--]]

return {
	{
		"yetone/avante.nvim",
		dependencies = {
			{ "HakonHarnes/img-clip.nvim", pin = true },
			{ "MunifTanjim/nui.nvim", pin = true },
			{ "echasnovski/mini.icons", pin = true },
			{ "nvim-lua/plenary.nvim", pin = true },
			{ "stevearc/dressing.nvim", pin = true },
		},
		opts = {
			provider = "ollama",
			auto_suggestions_provider = "ollama",
			vendors = {
				---@type AvanteProvider
				ollama = {
					["local"] = true,
					endpoint = "127.0.0.1:11434/v1",
					model = "codegemma",
					parse_curl_args = function(opts, code_opts)
						return {
							url = opts.endpoint .. "/chat/completions",
							headers = {
								["Accept"] = "application/json",
								["Content-Type"] = "application/json",
							},
							body = {
								model = opts.model,
								messages = require("avante.providers").copilot.parse_message(code_opts),
								max_tokens = 2048,
								stream = true,
							},
						}
					end,
					parse_response_data = function(data_stream, event_state, opts)
						require("avante.providers").openai.parse_response(data_stream, event_state, opts)
					end,
				},
			},
		},
		build = "make",
		event = {
			"VeryLazy",
		},
		pin = true,
	},
}
