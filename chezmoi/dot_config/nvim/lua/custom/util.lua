local M = {
	_ansi_completed = nil,
	_ansi256_completed = nil,
	_augroup = nil,
	_truecolor_completed = nil,
}

M.ansi = function()
	if M._ansi_completed == nil then
		M._ansi_completed = vim.system({
			"test-ansi",
		}):wait()
	end
	return M._ansi_completed.code == 0
end

M.ansi256 = function()
	if M._ansi256_completed == nil then
		M._ansi256_completed = vim.system({
			"test-ansi256",
		}):wait()
	end
	return M._ansi256_completed.code == 0
end

--[[
Create autocmd in custom group.
--]]
M.autocmd = function(event, opts)
	if M._augroup == nil then
		M._augroup = vim.api.nvim_create_augroup("custom", {
			clear = true,
		})
	end
	opts.group = M._augroup
	return vim.api.nvim_create_autocmd(event, opts)
end

--[[
Create LSP capabilities.
--]]
M.capabilities = function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	-- use nvim-ufo for folding
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	return capabilities
end

--[[
Inspect all extmarks, including non-legacy signs.
:lua require("custom.util").dump_signs()
--]]
M.dump_signs = function()
	print(vim.inspect(vim.api.nvim_buf_get_extmarks(0, -1, 0, -1, {
		details = true,
	})))
end

--[[
Return the correct root directory for a git project.
--]]
M.git_dir = function()
	local cwd = vim.fn.getcwd()
	local file = vim.fn.resolve(vim.fn.expand("%"))
	if file ~= "" then
		cwd = vim.fn.fnamemodify(file, ":p:h")
	end
	-- fix cwd in oil buffers
	cwd = string.gsub(cwd, "oil:", "")
	return cwd
end

--[[
Configure indentation with spaces.
--]]
M.indent_with_spaces = function(shiftwidth)
	vim.opt_local.expandtab = true
	vim.opt_local.shiftwidth = shiftwidth
end

--[[
Configure indentation with tabs.
--]]
M.indent_with_tabs = function(tabstop)
	vim.opt_local.expandtab = false
	vim.opt_local.shiftwidth = 0
	vim.opt_local.tabstop = tabstop
end

--[[
Insert values from src into dst if dst does not contain them.
--]]
M.list_extend_unique = function(dst, src)
	for _, value in ipairs(src) do
		if not vim.list_contains(dst, value) then
			table.insert(dst, value)
		end
	end
end

--[[
Source an after/ftplugin file.
--]]
M.source = function(filetype)
	dofile(vim.fn.stdpath("config") .. "/after/ftplugin/" .. filetype .. ".lua")
end

M.truecolor = function()
	if M._truecolor_completed == nil then
		M._truecolor_completed = vim.system({
			"test-truecolor",
		}):wait()
	end
	return M._truecolor_completed.code == 0
end

--[[
Create user command.
--]]
M.user_command = function(opts)
	local name = opts.name
	opts.name = nil
	local command = opts.command
	opts.command = nil
	vim.api.nvim_create_user_command(name, command, opts)
end

return M
