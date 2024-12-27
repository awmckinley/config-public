--[[
Blazing fast and easy to configure statusline.

Similar:
- nvimdev/galaxyline.nvim
- rebelot/heirline.nvim
--]]

function LualineMacro()
	local reg = vim.fn.reg_recording()
	if reg == "" then
		return ""
	end
	return "recording @" .. reg
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{ "echasnovski/mini.icons", pin = true },
		},
		opts = {
			sections = {
				lualine_a = {
					"mode",
					"LualineMacro()",
				},
				lualine_b = {
					"branch",
					"diff",
					"diagnostics",
				},
				lualine_c = {
					"filename",
					"filesize",
				},
				lualine_x = {
					"filetype",
				},
				lualine_y = {
					"selectioncount",
					"searchcount",
					"progress",
				},
				lualine_z = {
					"location",
				},
			},
		},
		event = {
			"VeryLazy",
		},
		pin = true,
	},
}
