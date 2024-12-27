--[[
Debug Adapter Protocol client.
--]]

---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
		return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
	end
	return config
end

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "leoluz/nvim-dap-go", pin = true },
			{ "rcarriga/nvim-dap-ui", pin = true },
			{ "theHamsta/nvim-dap-virtual-text", pin = true },
		},
		keys = {
			{
				"<C-F5>",
				function()
					require("dap").restart()
				end,
				desc = "Restart",
			},
			{
				"<F7>",
				function()
					require("dap").step_into()
				end,
				desc = "Step into",
			},
			{
				"<F8>",
				function()
					require("dap").step_over()
				end,
				desc = "Step over",
			},
			{
				"<F9>",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<M-F9>",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to cursor",
			},
			{
				"<F20>", -- Shift+F8
				function()
					require("dap").step_out()
				end,
				desc = "Step out",
			},
			{
				"<Leader>da",
				function()
					require("dap").continue({ before = get_args })
				end,
				desc = "Run with args",
			},
			{
				"<Leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle breakpoint",
			},
			{
				"<Leader>dB",
				function()
					local condition = vim.fn.input("Breakpoint condition: ")
					require("dap").set_breakpoint(condition)
				end,
				desc = "Breakpoint condition",
			},
			{
				"<Leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<Leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to cursor",
			},
			{
				"<Leader>dg",
				function()
					require("dap").goto_()
				end,
				desc = "Go to line (no execute)",
			},
			{
				"<Leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step into",
			},
			{
				"<Leader>dj",
				function()
					require("dap").down()
				end,
				desc = "Down",
			},
			{
				"<Leader>dk",
				function()
					require("dap").up()
				end,
				desc = "Up",
			},
			{
				"<Leader>dl",
				function()
					require("dap").run_last()
				end,
				desc = "Run last",
			},
			{
				"<Leader>do",
				function()
					require("dap").step_out()
				end,
				desc = "Step out",
			},
			{
				"<Leader>dO",
				function()
					require("dap").step_over()
				end,
				desc = "Step over",
			},
			{
				"<Leader>dp",
				function()
					require("dap").pause()
				end,
				desc = "Pause",
			},
			{
				"<Leader>dr",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Toggle REPL",
			},
			{
				"<Leader>ds",
				function()
					require("dap").session()
				end,
				desc = "Session",
			},
			{
				"<Leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<Leader>dw",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "Widgets",
			},
		},
		pin = true,
	},
}
