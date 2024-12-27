if command -v starship >/dev/null 2>&1; then
	if test-ansi; then
		export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/plain.toml"
	else
		export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/default.toml"
	fi

	eval "$(starship init zsh)"
fi
