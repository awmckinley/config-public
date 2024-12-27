--[[
Add virtual text support to nvim-dap.
--]]

return {
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {
			display_callback = function(variable)
				local name = string.lower(variable.name)
				local value = string.lower(variable.value)
				if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
					return "*****"
				end
				if #variable.value > 15 then
					return " " .. string.sub(variable.value, 1, 15) .. "... "
				end
				return " " .. variable.value
			end,
		},
		pin = true,
	},
}
