--[[
Highlight changed text after any action which modifies the current buffer.
--]]

return {
	{
		"tzachar/highlight-undo.nvim",
		opts = {
			duration = 250,
		},
		pin = true,
	},
}
