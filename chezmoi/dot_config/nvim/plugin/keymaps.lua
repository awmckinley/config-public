--[[
Create mappings.
--]]

-- delete mappings
-- TODO: change these?
vim.keymap.del("n", "<C-W>d")
vim.keymap.del("n", "<C-W><C-D>")

-- disable hlsearch, otherwise "enter"
vim.keymap.set("n", "<CR>", function()
	if vim.v.hlsearch == 1 then
		vim.cmd.nohl()
		return ""
	else
		return vim.keycode("<CR>")
	end
end, {
	expr = true,
})

-- exec current line
vim.keymap.set("n", "<Leader>ce", "<Cmd>.lua<CR>", {
	desc = "Execute the current line",
})

-- source current file
vim.keymap.set("n", "<Leader>cE", "<Cmd>source %<CR>", {
	desc = "Execute the current file",
})
