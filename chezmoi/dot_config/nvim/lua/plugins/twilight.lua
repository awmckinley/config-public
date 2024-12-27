--[[
Dims inactive portions of the code you're editing.
--]]

return {
	{
		"folke/twilight.nvim",
		opts = {},
		cmd = {
			"Twilight",
			"TwilightDisable",
			"TwilightEnable",
		},
		pin = true,
	},
}
