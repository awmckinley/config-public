--[[
Indent guides.

Similar:
- echasnovski/mini.indentscope
--]]

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = {
				show_start = false,
				show_end = false,
			},
			exclude = {
				filetypes = {
					"help",
				},
			},
		},
		main = "ibl",
		event = {
			"BufNewFile",
			"BufReadPost",
			"BufWritePre",
		},
		pin = true,
	},
}
