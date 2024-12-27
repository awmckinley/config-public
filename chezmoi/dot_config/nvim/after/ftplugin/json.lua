vim.opt_local.conceallevel = 0

if vim.fn.expand("%"):match("lock") then
	require("custom.util").indent_with_spaces(2)
else
	require("custom.util").indent_with_tabs(4)
end
