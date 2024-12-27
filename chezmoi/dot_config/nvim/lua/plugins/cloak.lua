--[[
Overlay "*" over defined patterns in defined files.
--]]

return {
	{
		"laytan/cloak.nvim",
		opts = {
			patterns = {
				{
					file_pattern = ".env*",
					cloak_pattern = "=.+",
					replace = nil,
				},
				{
					file_pattern = "*.pw",
					cloak_pattern = ".*",
					replace = nil,
				},
			},
		},
		event = {
			"VeryLazy",
		},
		cmd = {
			"CloakDisable",
			"CloakEnable",
			"CloakPreviewLine",
			"CloakToggle",
		},
		pin = true,
	},
}
