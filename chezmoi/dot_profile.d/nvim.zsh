if command -v nvim >/dev/null 2>&1; then
	export EDITOR=nvim
	export VISUAL=nvim

	# launch with codeium flag
	alias nvim-codeium='NVIM_CODIUM=true nvim'

	# launch with debug flag
	alias nvim-debug='NVIM_DEBUG=true nvim'

	# launch with supermaven flag
	alias nvim-supermaven='NVIM_SUPERMAVEN=true nvim'

	# shows terminal capabilities
	alias nvim-verbose='nvim -V3'
fi
