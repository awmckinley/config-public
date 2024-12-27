--[[
Set the `commentstring` based on cursor location in the file.

Similar:
- folke/ts-comments.nvim
--]]

return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {
			enable_autocmd = false,
		},
		pin = true,
	},
}
