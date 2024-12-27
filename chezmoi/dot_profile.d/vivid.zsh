if command -v vivid >/dev/null 2>&1; then
	vivid_theme='catppuccin-mocha'
	if test-truecolor; then
		export LS_COLORS="$(vivid --color-mode 24-bit generate "${vivid_theme}")"
	elif test-ansi256; then
		export LS_COLORS="$(vivid --color-mode 8-bit generate "${vivid_theme}")"
	fi
fi
