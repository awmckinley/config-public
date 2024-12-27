--[[
Makes you better at Vim movements.
--]]

return {
	{
		"ThePrimeagen/vim-be-good",
		dependencies = {
			{ "nvim-lua/plenary.nvim", pin = true },
		},
		cmd = {
			"VimBeGood",
		},
		pin = true,
	},
}
