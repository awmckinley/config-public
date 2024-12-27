--[[
Treesitter configurations and abstraction layer.

nvim-treesitter/playground is deprecated in favor of:
:Inspect
:InspectTree
:EditQuery
--]]

---@diagnostic disable-next-line: unused-local
local function should_disable(lang, bufnr)
	local size = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr or 0))
	if size > 2000000 or size == -2 then
		return true
	end
	return false
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		cond = true,
		opts = {
			-- required parsers
			ensure_installed = {
				"bash",
				"c",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"regex",
				"vim",
				"vimdoc",
			},
			-- ignore missing parsers when entering buffer
			auto_install = false,
			highlight = {
				-- use treesitter for syntax highlighting
				enable = true,
				disable = should_disable,
			},
			incremental_selection = {
				-- use treesitter for incremental selection
				enable = true,
				keymaps = {
					-- TODO: change to <Leader>v?
					init_selection = "<M-v>",
					node_incremental = "<M-v>",
					scope_incremental = false,
					node_decremental = "<BS>",
				},
			},
			indent = {
				-- use treesitter for indentation
				enable = true,
				disable = should_disable,
			},
		},
		config = function(_, opts)
			local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

			-- add D2
			parser_configs["d2"] = {
				filetype = "d2",
				install_info = {
					url = "https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2",
					revision = "1e6d8ca3d85c0031ff010759bb60804dd47b95f2",
					files = {
						"src/parser.c",
						"src/scanner.c",
					},
				},
			}

			require("nvim-treesitter.configs").setup(opts)
		end,
		-- main = "nvim-treesitter.configs",
		build = ":TSUpdate",
		lazy = false,
		cmd = {
			"TSBufDisable",
			"TSBufEnable",
			"TSBufToggle",
			"TSConfigInfo",
			"TSDisable",
			"TSEditQuery",
			"TSEditQueryUserAfter",
			"TSEnable",
			"TSInstall",
			"TSInstallFromGrammar",
			"TSInstallInfo",
			"TSInstallSync",
			"TSModuleInfo",
			"TSToggle",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
		},
		keys = {
			{
				"<BS>",
				desc = "Decrement selection",
				mode = { "x" },
			},
			{
				"<M-v>",
				desc = "Increment selection",
				mode = { "n", "x" },
			},
		},
		version = false,
		pin = true,
	},
}
