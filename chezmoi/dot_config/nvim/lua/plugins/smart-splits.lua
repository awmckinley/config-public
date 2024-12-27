--[[
Seamless navigation between tmux panes and Neovim splits.

Similar:
- christoomey/vim-tmux-navigator
- numToStr/Navigator.nvim
--]]

return {
	{
		"mrjones2014/smart-splits.nvim",
		opts = {},
		cmd = {
			"SmartCursorMoveDown",
			"SmartCursorMoveLeft",
			"SmartCursorMoveRight",
			"SmartCursorMoveUp",
			"SmartResizeDown",
			"SmartResizeLeft",
			"SmartResizeMode",
			"SmartResizeRight",
			"SmartResizeUp",
			"SmartSplitsLog",
			"SmartSplitsLogLevel",
			"SmartSwapDown",
			"SmartSwapLeft",
			"SmartSwapRight",
			"SmartSwapUp",
		},
		keys = {
			{
				"<C-W>h",
				"<Cmd>SmartCursorMoveLeft<CR>",
				desc = "Move left",
			},
			{
				"<C-W>j",
				"<Cmd>SmartCursorMoveDown<CR>",
				desc = "Move down",
			},
			{
				"<C-W>k",
				"<Cmd>SmartCursorMoveUp<CR>",
				desc = "Move up",
			},
			{
				"<C-W>l",
				"<Cmd>SmartCursorMoveRight<CR>",
				desc = "Move right",
			},
			{
				"<C-W><Down>",
				"<Cmd>SmartResizeDown<CR>",
				desc = "Resize down",
			},
			{
				"<C-W><Left>",
				"<Cmd>SmartResizeLeft<CR>",
				desc = "Resize left",
			},
			{
				"<C-W><Right>",
				"<Cmd>SmartResizeRight<CR>",
				desc = "Resize right",
			},
			{
				"<C-W><Up>",
				"<Cmd>SmartResizeUp<CR>",
				desc = "Resize up",
			},
		},
		pin = true,
	},
}
