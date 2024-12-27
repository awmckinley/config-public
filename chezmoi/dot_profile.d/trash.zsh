if command -v trash >/dev/null 2>&1; then
	# disable rm
	alias rm='printf "ERROR: use trash instead\n"'
fi
