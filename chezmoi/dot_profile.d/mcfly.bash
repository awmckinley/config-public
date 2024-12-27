if command -v mcfly >/dev/null 2>&1; then
	eval "$(mcfly init bash)"
fi

if command -v mcfly-fzf >/dev/null 2>&1; then
	eval "$(mcfly-fzf init bash)"
fi
