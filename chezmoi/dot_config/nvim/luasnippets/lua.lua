--[[
Lua snippets.
--]]

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		{
			trig = "lazy_dep",
			desc = "Lazy dependency",
		},
		fmta('{ "<a>/<b>", pin = true },', {
			a = i(1, "owner"),
			b = i(2, "repo"),
		})
	),

	s(
		{
			trig = "lazy_spec",
			desc = "Lazy spec",
		},
		fmta(
			[[
{
	-- See: https://lazy.folke.io/spec
	"<a>/<b>",
	-- dependencies = {},
	-- cond = not vim.g.vscode,
	-- priority = 50,
	-- init = function(lazy) end,
	-- opts = {},
	-- config = function(_lazy, opts) end,
	-- main = "",
	-- build = "",
	-- lazy = true,
	-- event = {},
	-- cmd = {},
	-- ft = "lua",
	-- keys = {},
	-- version = "*",
	pin = true,
},
			]],
			{
				a = i(1, "owner"),
				b = i(2, "repo"),
			}
		)
	),

	s(
		{
			trig = "luasnip_locals",
			desc = "LuaSnip locals",
		},
		fmta(
			[[
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key
			]],
			{}
		)
	),

	s(
		{
			trig = "luasnip_snippet",
			desc = "LuaSnip snippet",
		},
		fmta(
			[[
	s(
		{
			trig = "<a>",
			desc = "<b>",
		},
		fmta("", {})
	),
		]],
			{
				a = i(1, "trigger"),
				b = i(2, "description"),
			}
		)
	),
}
