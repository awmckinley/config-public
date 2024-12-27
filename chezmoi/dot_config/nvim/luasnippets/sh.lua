--[[
Bash snippets.
--]]

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		{
			trig = "#!",
			desc = "shebang",
		},
		t({
			"#!/usr/bin/env bash",
		})
	),

	s(
		{
			trig = "has",
			desc = "command exists?",
		},
		fmt("if command -v {a} >/dev/null 2>&1; then", {
			a = i(1, "hello"),
		})
	),

	s(
		{
			-- http://redsymbol.net/articles/unofficial-bash-strict-mode/
			trig = "strict",
			desc = "strict mode",
		},
		t({
			"set -o errexit  # exit if any command fails",
			"set -o nounset  # prevent using an undefined variable",
			"set -o pipefail # pipelines fail early",
			"IFS=$'\\n\\t'",
		})
	),

	s(
		{
			trig = "tty",
			desc = "redirect tty",
		},
		t({
			"# check for tty",
			"stdin_available=1",
			"(exec </dev/tty) 2>/dev/null || stdin_available=0",
			"",
			'if test "${stdin_available}" = 1; then',
			"	# set stdin to tty",
			"	exec </dev/tty",
			"",
			"	# set stdout to tty on Windows",
			'	if test "${OSTYPE}" = cygwin || test "${OSTYPE}" = msys || test "${OSTYPE}" = win32; then',
			"		exec >/dev/tty",
			"	fi",
			"fi",
		})
	),

	s(
		{
			trig = "usage",
			desc = "usage guard",
		},
		fmt(
			[[
# name arguments
{a}="${{1:-}}"

# validate arguments
if test -z "${{{a}}}"; then
	echo "Usage: $(basename "$0") <{a}>" >&2
	exit 1
fi
			]],
			{
				a = i(1, "arg"),
			},
			{
				repeat_duplicates = true,
			}
		)
	),
}
