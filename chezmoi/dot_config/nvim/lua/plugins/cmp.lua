--[[
nvim-cmp fork.
--]]

return {
	{
		"iguanacucumber/magazine.nvim",
		name = "nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-buffer", pin = true },
			{ "hrsh7th/cmp-cmdline", pin = true },
			{ "hrsh7th/cmp-nvim-lsp", pin = true },
			{ "hrsh7th/cmp-path", pin = true },
			{ "onsails/lspkind.nvim", pin = true },
			{ "petertriho/cmp-git", pin = true },
			{ "saadparwaiz1/cmp_luasnip", pin = true },
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			-- setup
			cmp.setup({
				formatting = {
					expandable_indicator = false,
					fields = {
						cmp.ItemField.Kind,
						cmp.ItemField.Abbr,
						cmp.ItemField.Menu,
					},
					format = lspkind.cmp_format({
						mode = "symbol",
					}),
				},
				mapping = {
					["<C-N>"] = cmp.mapping.select_next_item({
						behavior = cmp.SelectBehavior.Insert,
					}),
					["<C-P>"] = cmp.mapping.select_prev_item({
						behavior = cmp.SelectBehavior.Insert,
					}),
					["<C-Y>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
						{ "i", "c" }
					),
				},
				snippet = {
					expand = function(args)
						-- handle LSP snippet expansion with LuaSnip
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = {
					{
						name = "lazydev",
						group_index = 1,
					},
					{
						name = "codeium",
						group_index = 2,
					},
					{
						name = "luasnip",
					},
					{
						name = "nvim_lsp",
						option = {
							markdown_oxide = {
								keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
							},
						},
					},
					{
						name = "buffer",
					},
				},
			})

			-- setup search
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = {
					["<C-N>"] = cmp.mapping.select_next_item(),
					["<C-P>"] = cmp.mapping.select_prev_item(),
					["<C-Y>"] = cmp.mapping.confirm({
						select = true,
					}),
				},
				sources = {
					{
						name = "buffer",
					},
				},
			})

			-- setup command
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{
						name = "path",
					},
					{
						name = "cmdline",
					},
				},
				matching = {
					disallow_fuzzy_matching = false,
					disallow_fullfuzzy_matching = false,
					disallow_partial_fuzzy_matching = true,
					disallow_partial_matching = false,
					disallow_prefix_unmatching = false,
					disallow_symbol_nonprefix_matching = false,
				},
			})

			-- setup gitcommit
			cmp.setup.filetype("gitcommit", {
				sources = {
					{
						name = "git",
					},
					{
						name = "buffer",
					},
				},
			})

			-- setup SQL
			cmp.setup.filetype({ "mysql", "plsql", "sql" }, {
				sources = {
					{
						name = "vim-dadbod-completion",
					},
					{
						name = "buffer",
					},
				},
			})
		end,
		event = {
			"InsertEnter",
		},
		pin = true,
	},
}
