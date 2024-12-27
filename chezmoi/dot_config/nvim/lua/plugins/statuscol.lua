--[[
Configurable statuscolumn and click handlers.

Use `luukvbaal/statuscol.nvim` to prevent numeric fold column.
--]]

return {
	{
		"luukvbaal/statuscol.nvim",
		lazy = false,
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				segments = {
					{
						-- number column
						text = {
							builtin.lnumfunc,
							" ",
						},
						click = "v:lua.ScLa",
					},
					{
						-- extmark + signs column
						click = "v:lua.ScSa",
						sign = {
							name = {
								".*",
							},
							namespace = {
								".*",
							},
							colwidth = 1,
						},
					},
					{
						-- fold column
						text = {
							builtin.foldfunc,
							" ",
						},
						click = "v:lua.ScFa",
					},
				},
			})
		end,
		pin = true,
	},
}
