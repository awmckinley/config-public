--[[
UI for nvim-dap.
--]]

return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{ "nvim-neotest/nvim-nio", pin = true },
		},
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup(opts)

			dap.listeners.after.event_initialized.dapui_config = function()
				dapui.open({})
			end

			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close({})
			end

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close({})
			end
		end,
		keys = {
			{
				"<M-F8>",
				function()
					---@diagnostic disable-next-line: missing-fields
					require("dapui").eval(nil, {
						enter = true,
					})
				end,
				desc = "Eval",
				mode = { "n", "v" },
			},
			{
				"<Leader>de",
				function()
					---@diagnostic disable-next-line: missing-fields
					require("dapui").eval(nil, {
						enter = true,
					})
				end,
				desc = "Eval",
				mode = { "n", "v" },
			},
			{
				"<Leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "DAP UI",
			},
		},
		pin = true,
	},
}
