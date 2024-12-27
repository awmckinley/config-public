--[[
Use Codeium.
--]]

return {
	{
		"Exafunction/codeium.vim",
		cond = not vim.g.vscode and vim.env.NVIM_CODEIUM ~= nil,
		init = function()
			vim.g.codeium_disable_bindings = 1
			vim.g.codeium_filetypes = {
				TelescopePrompt = false,
			}
		end,
		build = ":Codeium Auth",
		event = {
			"BufEnter",
		},
		cmd = {
			"Codeium",
		},
		keys = {
			{
				"<C-G>",
				function()
					return vim.fn["codeium#Clear"]()
				end,
				desc = "Clear suggestion",
				expr = true,
				mode = { "i" },
				silent = true,
			},
			{
				"<C-N>",
				function()
					return vim.fn["codeium#CycleCompletions"](1)
				end,
				desc = "Next suggestion",
				expr = true,
				mode = { "i" },
				silent = true,
			},
			{
				"<C-Y>",
				function()
					return vim.fn["codeium#Accept"]()
				end,
				desc = "Accept suggestion",
				expr = true,
				mode = { "i" },
				silent = true,
			},
		},
		pin = true,
	},
}
