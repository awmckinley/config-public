--[[
Debug individual Python test methods or classes.
--]]

return {
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			{ "mfussenegger/nvim-dap", pin = true },
		},
		config = function()
			require("dap-python").setup("python")
		end,
		ft = {
			"python",
		},
		pin = true,
	},
}
