--[[
Modern database interface.

Similar:
- kndndrj/nvim-dbee
--]]

return {
	{
		"kristijanhusak/vim-dadbod-completion",
		dependencies = {
			{ "tpope/vim-dadbod", pin = true },
		},
		ft = {
			"mysql",
			"plsql",
			"sql",
		},
		pin = true,
	},

	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "kristijanhusak/vim-dadbod-completion", pin = true },
			{ "tpope/vim-dadbod", pin = true },
		},
		init = function()
			local custom = require("custom.util")
			if custom.truecolor() then
				vim.g.db_ui_use_nerd_fonts = 1
			else
				vim.g.db_ui_use_nerd_fonts = 0
			end
		end,
		cmd = {
			"DBUI",
			"DBUIAddConnection",
			"DBUIFindBuffer",
			"DBUIToggle",
		},
		keys = {
			{
				"<Leader>ud",
				"<Cmd>DBUIToggle<CR>",
				desc = "Dadbod",
			},
		},
		pin = true,
	},

	{
		"tpope/vim-dadbod",
		cmd = {
			"DB",
		},
		pin = true,
	},
}
