#!/usr/bin/env bash

if command -v dconf >/dev/null 2>&1; then
	dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
fi
