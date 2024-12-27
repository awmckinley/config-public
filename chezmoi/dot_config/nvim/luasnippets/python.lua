--[[
Python snippets.
--]]

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
	s(
		{
			trig = "#!",
			desc = "shebang",
		},
		t({
			"#!/usr/bin/env python",
		})
	),

	s(
		{
			trig = "main",
			desc = "main",
		},
		t({
			'if __name__ == "__main__":',
		})
	),
}
