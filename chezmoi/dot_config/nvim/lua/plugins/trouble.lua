--[[
Pretty diagnostics, references, telescope results, quickfix and location lists.

Similar:
- onsails/diaglist.nvim
--]]

return {
	{
		"folke/trouble.nvim",
		dependencies = {
			{ "echasnovski/mini.icons", pin = true },
		},
		opts = {
			modes = {
				lsp = {
					win = {
						position = "right",
					},
				},
			},
		},
		cmd = {
			"Trouble",
		},
		keys = {
			{
				"[x",
				function()
					local trouble = require("trouble")
					if trouble.is_open() then
						---@diagnostic disable-next-line: missing-fields, missing-parameter
						trouble.prev({
							skip_groups = true,
							jump = true,
						})
					end
				end,
				desc = "Previous Trouble item",
			},
			{
				"]x",
				function()
					local trouble = require("trouble")
					if trouble.is_open() then
						---@diagnostic disable-next-line: missing-fields, missing-parameter
						trouble.next({
							skip_groups = true,
							jump = true,
						})
					end
				end,
				desc = "Next Trouble item",
			},
			{
				"<Leader>xd",
				"<Cmd>Trouble<CR>",
				desc = "Trouble",
			},
		},
		pin = true,
	},
}
