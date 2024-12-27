--[[
Write and navigate Obsidian vaults.
--]]

local ws_name = vim.env.OBSIDIAN_VAULT_NAME
local ws_path = vim.env.OBSIDIAN_VAULT_PATH

return {
	{
		"epwalsh/obsidian.nvim",
		dependencies = {
			{ "hrsh7th/nvim-cmp", pin = true },
			{ "nvim-lua/plenary.nvim", pin = true },
			{ "nvim-telescope/telescope.nvim", pin = true },
			{ "nvim-treesitter/nvim-treesitter", pin = true },
		},
		cond = not vim.g.vscode and ws_name ~= nil and ws_path ~= nil,
		opts = {
			workspaces = {
				{
					name = ws_name,
					path = ws_path,
				},
			},
			log_level = vim.log.levels.INFO,
			daily_notes = {
				folder = "calendar",
				date_format = "%Y/%Y-%m-%d",
				default_tags = {
					"daily-notes",
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			wiki_link_func = "prepend_note_id",
			note_frontmatter_func = function(note)
				local out = note.metadata or {}
				out.aliases = note.aliases
				out.created = nil
				out.id = vim.fn.fnamemodify(note.path.filename, ":t:r")
				out.tags = note.tags
				if out.title == nil then
					out.title = note.id
				end
				return out
			end,
			templates = {
				folder = "template",
			},
			picker = {
				name = "telescope.nvim",
				note_mappings = {
					new = "<C-Y>",
				},
			},
			sort_by = "modified",
			sort_reversed = true,
			open_notes_in = "vsplit",
			ui = {
				checkboxes = {
					[" "] = {
						char = "󰄱",
						hl_group = "ObsidianTodo",
					},
					["x"] = {
						char = "",
						hl_group = "ObsidianDone",
					},
					[">"] = {
						char = "",
						hl_group = "ObsidianRightArrow",
					},
					["-"] = {
						char = "󰰱",
						hl_group = "ObsidianTilde",
					},
					["!"] = {
						char = "",
						hl_group = "ObsidianImportant",
					},
				},
			},
		},
		lazy = true,
		cmd = {
			"ObsidianBacklinks",
			"ObsidianDailies",
			"ObsidianExtractNote",
			"ObsidianLink",
			"ObsidianLinkNew",
			"ObsidianLinks",
			"ObsidianOpen",
			"ObsidianPasteImg",
			"ObsidianQuickSwitch",
			"ObsidianRename",
			"ObsidianSearch",
			"ObsidianTOC",
			"ObsidianTags",
			"ObsidianTemplate",
		},
		ft = {
			"markdown",
		},
		keys = {
			{
				"<Leader>nb",
				"<Cmd>ObsidianBacklinks<CR>",
				desc = "Backlinks",
			},
			{
				"<Leader>nc",
				"<Cmd>ObsidianTOC<CR>",
				desc = "Contents",
			},
			{
				"<Leader>nd",
				"<Cmd>ObsidianDailies -10 0<CR>",
				desc = "Daily notes",
			},
			{
				"<Leader>nl",
				"<Cmd>ObsidianLinks<CR>",
				desc = "Links",
			},
			{
				"<Leader>nm",
				"<Cmd>ObsidianTemplate<CR>",
				desc = "Template",
			},
			{
				"<Leader>no",
				"<Cmd>ObsidianOpen<CR>",
				desc = "Open note",
			},
			{
				"<Leader>np",
				"<Cmd>ObsidianPasteImg<CR>",
				desc = "Paste image",
			},
			{
				"<Leader>nq",
				"<Cmd>ObsidianQuickSwitch<CR>",
				desc = "Quick switch",
			},
			{
				"<Leader>nr",
				"<Cmd>ObsidianRename<CR>",
				desc = "Rename",
			},
			{
				"<Leader>ns",
				"<Cmd>ObsidianSearch<CR>",
				desc = "Search",
			},
			{
				"<Leader>nt",
				"<Cmd>ObsidianTags<CR>",
				desc = "Tags",
			},
		},
		pin = true,
	},
}
