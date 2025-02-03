if command -v bat >/dev/null 2>&1; then
	export LESSCOLORIZER='bat'
	export MANROFFOPT='-c'

	# col -b (--no-backspaces)
	# col -x (--spaces)
	export MANPAGER='sh -c "col -bx | bat --plain --language=man"'

	if test-truecolor; then
		if is-dark; then
			export BAT_THEME='Catppuccin Mocha'
		else
			export BAT_THEME='Catppuccin Latte'
		fi
	elif test-ansi256; then
		export BAT_THEME=base16-256
	elif test-ansi; then
		export BAT_THEME=ansi
	fi

	help() {
		"$@" --help 2>&1 | bat --plain --language=help
	}
fi
