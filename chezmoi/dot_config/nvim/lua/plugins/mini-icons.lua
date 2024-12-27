--[[
Icon provider.

Similar:
- nvim-tree/nvim-web-devicons
--]]

return {
	{
		"echasnovski/mini.icons",
		opts = function()
			local opts = {
				style = "ascii",
			}
			if require("custom.util").ansi256() then
				opts.style = "glyph"
			end
			return opts
		end,
		config = function(_, opts)
			require("mini.icons").setup(opts)
			MiniIcons.mock_nvim_web_devicons()
		end,
		lazy = false,
		pin = true,
	},
}
