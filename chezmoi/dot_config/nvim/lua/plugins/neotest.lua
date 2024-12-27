--[[
Framework for interacting with tests.
--]]

return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			{ "antoinemadec/FixCursorHold.nvim", pin = true },
			{ "nvim-lua/plenary.nvim", pin = true },
			{ "nvim-neotest/neotest-jest", pin = true },
			{ "nvim-neotest/nvim-nio", pin = true },
			{ "nvim-treesitter/nvim-treesitter", pin = true },
			{ "rcasia/neotest-bash", pin = true },
		},
		config = function()
			local neotest = require("neotest")
			---@diagnostic disable-next-line: missing-fields
			neotest.setup({
				adapters = {
					require("neotest-bash"),
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "jest.config.ts",
					}),
				},
				output = {
					enabled = true,
					open_on_run = true,
				},
				status = {
					enabled = true,
					signs = true,
					virtual_text = true,
				},
			})
		end,
		cmd = {
			"Neotest",
		},
		keys = {
			{
				"<Leader>td",
				"<Cmd>Neotest run strategy=dap<CR>",
				desc = "Debug nearest",
			},
			{
				"<Leader>tl",
				"<Cmd>Neotest run last<CR>",
				desc = "Run last",
			},
			{
				"<Leader>to",
				function()
					require("neotest").output.open({
						enter = true,
						auto_close = true,
					})
				end,
				desc = "Show output",
			},
			{
				"<Leader>tO",
				"<Cmd>Neotest output-panel toggle<CR>",
				desc = "Toggle output panel",
			},
			{
				"<Leader>tr",
				"<Cmd>Neotest run<CR>",
				desc = "Run nearest",
			},
			{
				"<Leader>ts",
				"<Cmd>Neotest summary toggle<CR>",
				desc = "Toggle summary",
			},
			{
				"<Leader>tS",
				"<Cmd>Neotest stop<CR>",
				desc = "Stop",
			},
			{
				"<Leader>tt",
				function()
					local test = vim.fn.expand("%")
					require("neotest").run.run(test)
				end,
				desc = "Run file",
			},
			{
				"<Leader>tT",
				function()
					local test = vim.uv.cwd()
					require("neotest").run.run(test)
				end,
				desc = "Run all test files",
			},
			{
				"<Leader>tw",
				function()
					local test = vim.fn.expand("%")
					require("neotest").watch.toggle(test)
				end,
				desc = "Toggle watch",
			},
		},
		pin = true,
	},
}
