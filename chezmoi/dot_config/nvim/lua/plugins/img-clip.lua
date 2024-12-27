--[[
Embed images into any markup language.
--]]

return {
	{
		"HakonHarnes/img-clip.nvim",
		opts = {
			default = {
				embed_image_as_base64 = false,
				prompt_for_file_name = false,
				drag_and_drop = {
					insert_mode = true,
				},
				use_absolute_path = true,
			},
		},
		event = {
			"VeryLazy",
		},
		cmd = {
			"PasteImage",
		},
		pin = true,
	},
}
