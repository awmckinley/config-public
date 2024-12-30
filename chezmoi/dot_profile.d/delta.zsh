if command -v delta >/dev/null 2>&1; then
	if test-truecolor; then
		if is-dark; then
			export DELTA_FEATURES='+catppuccin-mocha'
		else
			export DELTA_FEATURES='+catppuccin-latte'
		fi
	elif test-ansi256; then
		export DELTA_FEATURES='+ansi256'
	elif test-ansi; then
		export DELTA_FEATURES='+ansi'
	fi
fi
