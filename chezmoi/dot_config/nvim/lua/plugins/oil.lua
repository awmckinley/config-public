--[[
Edit your filesystem like a buffer.

Similar:
- drchip/netrw.vim
- echasnovski/mini.files
- nvim-telescope/telescope-file-browser.nvim
- nvim-tree/nvim-tree
- tpope/vim-vinegar
--]]

return {
	{
		"stevearc/oil.nvim",
		dependencies = {
			{ "echasnovski/mini.icons", pin = true },
		},
		opts = {
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			-- change to false to restore netrw
			default_file_explorer = true,
			delete_to_trash = true,
			keymaps = {
				["`"] = "actions.tcd",
			},
			view_options = {
				is_always_hidden = function(name)
					return name == ".."
				end,
				show_hidden = true,
			},
		},
		cmd = {
			"Oil",
		},
		keys = {
			{
				"-",
				"<Cmd>Oil<CR>",
				desc = "Open parent directory",
			},
			{
				"_",
				function()
					require("oil").open(vim.fn.getcwd())
				end,
				desc = "Open CWD",
			},
		},
		lazy = false,
		pin = true,
	},
}
