--[[
YAML snippets.
--]]

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		{
			trig = "mani",
			desc = "mani project",
		},
		fmt(
			[[
github.com/{a}/{b}:
  path: ~/Code/github.com/{a}/{b}
  url: https://github.com/{a}/{b}
			]],
			{
				a = i(1, "user"),
				b = i(2, "repo"),
			},
			{
				repeat_duplicates = true,
			}
		)
	),
}
