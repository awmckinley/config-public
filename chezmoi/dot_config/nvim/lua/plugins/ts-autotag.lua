--[[
Use treesitter to autoclose and autorename HTML tags.
--]]

return {
	{
		"windwp/nvim-ts-autotag",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", pin = true },
		},
		opts = {
			opts = {
				enable_close = true,
				enable_close_on_slash = true,
				enable_rename = true,
			},
		},
		pin = true,
	},
}
