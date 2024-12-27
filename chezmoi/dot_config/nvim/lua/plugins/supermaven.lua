--[[
Use Supermaven.
--]]

return {
	{
		"supermaven-inc/supermaven-nvim",
		cond = not vim.g.vscode and vim.env.NVIM_SUPERMAVEN ~= nil,
		opts = {
			ignore_filetypes = {
				oil = true,
				TelescopePrompt = true,
			},
		},
		cmd = {
			"SupermavenClearLog",
			"SupermavenLogout",
			"SupermavenRestart",
			"SupermavenShowLog",
			"SupermavenStart",
			"SupermavenStatus",
			"SupermavenStop",
			"SupermavenToggle",
			"SupermavenUseFree",
		},
		pin = true,
	},
}
