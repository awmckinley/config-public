if command -v biome >/dev/null 2>&1; then
	# increase max-size as needed
	alias biome-format='biome format --indent-style=tab --line-width=84 --files-max-size=2306867 --write'
fi
