--[[
Super powerful autopairs.

Similar:
- altermo/ultimate-autopair.nvim
- cohama/lexima.vim
- echasnovski/mini.pairs
- jiangmiao/vim-autopairs
- Raimondi/delimitMate
--]]

return {
	{
		"windwp/nvim-autopairs",
		opts = {
			disable_filetype = {
				"grug-far",
				"TelescopePrompt",
			},
			fast_wrap = nil,
		},
		event = {
			"InsertEnter",
		},
		pin = true,
	},
}
