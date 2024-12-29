#!/usr/bin/env bash
#
# Handle skhd_mode change.

# load variables
if "${HOME}/.local/bin/is-dark"; then
	source /etc/theme.dark.env
else
	source /etc/theme.light.env
fi

MODE="${MODE:-NORMAL}"

if test "$MODE" = WINDOW; then
	bar_color="0xff${BASE0F}" # or BASE09
	label_color="0xff${BASE00}"
else
	bar_color="0xff${BASE00}"
	label_color="0xff${BASE06}"
fi

sketchybar \
	--bar color="$bar_color" \
	--set skhd_mode \
	label="$MODE" \
	label.color="$label_color"
