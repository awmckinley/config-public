--[[
A modern plugin manager for Neovim.
--]]

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=v11.11.1",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- global mappings use <Leader>
vim.g.mapleader = " "

-- filetype mappings use <LocalLeader>
vim.g.maplocalleader = " "

-- setup lazy.nvim
require("lazy").setup({
	defaults = {
		cond = not vim.g.vscode,
	},
	spec = {
		-- pin itself
		{ "folke/lazy.nvim", pin = true },
		-- load specs
		{ import = "plugins" },
		-- load filetypes
		{ import = "plugins.ft.bicep" },
		{ import = "plugins.ft.clojure" },
		{ import = "plugins.ft.cs" },
		{ import = "plugins.ft.d2" },
		{ import = "plugins.ft.elixir" },
		{ import = "plugins.ft.git" },
		{ import = "plugins.ft.go" },
		{ import = "plugins.ft.html" },
		{ import = "plugins.ft.java" },
		{ import = "plugins.ft.javascript" },
		{ import = "plugins.ft.json" },
		{ import = "plugins.ft.just" },
		{ import = "plugins.ft.kotlin" },
		{ import = "plugins.ft.lua" },
		{ import = "plugins.ft.make" },
		{ import = "plugins.ft.markdown" },
		{ import = "plugins.ft.nix" },
		{ import = "plugins.ft.ocaml" },
		{ import = "plugins.ft.php" },
		{ import = "plugins.ft.python" },
		{ import = "plugins.ft.ruby" },
		{ import = "plugins.ft.rust" },
		{ import = "plugins.ft.sh" },
		{ import = "plugins.ft.sql" },
		{ import = "plugins.ft.ssh" },
		{ import = "plugins.ft.swift" },
		{ import = "plugins.ft.toml" },
		{ import = "plugins.ft.typst" },
		{ import = "plugins.ft.xml" },
		{ import = "plugins.ft.yaml" },
	},
	install = {
		colorscheme = { "default" },
	},
	ui = {
		-- Unicode symbols instead of Nerd Font
		-- TODO: if truecolor, use these or Nerd Font
		-- otherwise: ASCII
		icons = {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
		custom_keys = {
			["<LocalLeader>l"] = false,
			["<LocalLeader>t"] = false,
		},
	},
	checker = {
		-- automatic updates for unpinned
		enabled = true,
	},
	change_detection = {
		-- disable changes in VS Code
		enabled = not vim.g.vscode,
		-- silence notifications
		notify = false,
	},
})
