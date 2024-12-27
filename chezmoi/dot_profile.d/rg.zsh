if command -v rg >/dev/null 2>&1; then
	# disable ack
	alias ack='printf "ERROR: use rg instead\n"'

	# disable ag
	alias ag='printf "ERROR: use rg instead\n"'

	# disable pt
	alias pt='printf "ERROR: use rg instead\n"'
fi
