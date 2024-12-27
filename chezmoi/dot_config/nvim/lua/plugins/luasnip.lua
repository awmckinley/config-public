--[[
Snippet engine.

Similar:
- garymjr/nvim-snippets
- SirVer/ultisnips
--]]

return {
	{
		"L3MON4D3/LuaSnip",
		opts = {
			keep_roots = true,
			link_children = true,
			link_roots = true,
			update_events = "TextChanged,TextChangedI",
		},
		config = function(_, opts)
			local ls = require("luasnip")

			-- setup LuaSnip
			ls.config.setup(opts)

			-- load from ~/.config/nvim/luasnippets
			require("luasnip.loaders.from_lua").lazy_load()

			-- use sh snippets in zsh files
			ls.filetype_extend("zsh", {
				"sh",
			})

			---@diagnostic disable-next-line: duplicate-set-field
			vim.snippet.active = function(filter)
				filter = filter or {}
				filter.direction = filter.direction or 1
				if filter.direction == 1 then
					return ls.expand_or_jumpable()
				else
					return ls.jumpable(filter.direction)
				end
			end

			-- use LuaSnip for vim expand
			vim.snippet.expand = ls.lsp_expand

			---@diagnostic disable-next-line: duplicate-set-field
			vim.snippet.jump = function(direction)
				if direction == 1 then
					if ls.expandable() then
						return ls.expand_or_jump()
					else
						return ls.jumpable(1) and ls.jump(1)
					end
				else
					return ls.jumpable(-1) and ls.jump(-1)
				end
			end

			-- use LuaSnip for vim stop
			vim.snippet.stop = ls.unlink_current

			-- jump between nodes
			vim.keymap.set({ "i", "s" }, "<C-J>", function()
				return vim.snippet.active({
					direction = 1,
				}) and vim.snippet.jump(1)
			end, {
				silent = true,
			})

			-- jump between nodes
			vim.keymap.set({ "i", "s" }, "<C-K>", function()
				return vim.snippet.active({
					direction = -1,
				}) and vim.snippet.jump(-1)
			end, {
				silent = true,
			})

			-- cycle choice
			vim.keymap.set({ "i", "s" }, "<C-E>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, {
				silent = true,
			})
		end,
		build = "make install_jsregexp",
		version = "v2.3.0",
		pin = true,
	},
}
