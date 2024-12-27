if command -v zoxide >/dev/null 2>&1; then
	# init zoxide
	eval "$(zoxide init zsh)"

	# disable cd
	alias cd='printf "ERROR: use z instead\n"'
fi
