--[[
Create autocommands.
--]]

local custom = require("custom.util")

custom.autocmd("BufWritePre", {
	desc = "Remove eol whitespace",
	callback = function()
		if vim.bo.ft ~= "markdown" then
			vim.cmd([[%s/\s\+$//e]])
		end
	end,
})

if jit.os == "Linux" or jit.os == "OSX" then
	custom.autocmd("BufWritePost", {
		desc = "Make scripts executable",
		callback = function()
			local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
			if first_line and first_line:match("^#!") then
				local out = vim.fn.system({
					"chmod",
					"a+x",
					vim.fn.expand("%"),
				})
				if vim.v.shell_error ~= 0 then
					vim.api.nvim_echo({
						{ "Failed to set execute bit:\n", "ErrorMsg" },
						{ out, "WarningMsg" },
					}, true, {})
				end
			end
		end,
	})
end
