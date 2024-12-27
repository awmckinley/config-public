if command -v eza >/dev/null 2>&1; then
	# disable exa
	alias exa='printf "ERROR: use eza instead\n"'

	# disable ls
	alias ls='printf "ERROR: use eza instead\n"'

	# options
	stdopts='--group --header --group-directories-first'

	# l alias
	alias l='eza'
	alias la='eza --all --binary'
	alias ld='eza --only-dirs'
	alias li='eza --icons'
	alias lid='eza --icons --only-dirs'
	alias laa='eza --all --binary --all'
	alias lad='eza --all --binary --only-dirs'
	alias lai='eza --all --binary --icons'
	alias laid='eza --all --binary --icons --only-dirs'
	alias laad='eza --all --binary --all --only-dirs'
	alias laai='eza --all --binary --all --icons'
	alias laaid='eza --all --binary --all --icons --only-dirs'

	# lc alias
	alias lc="eza ${stdopts} --across"
	alias lca="eza ${stdopts} --across --all --binary"
	alias lcd="eza ${stdopts} --across --only-dirs"
	alias lci="eza ${stdopts} --across --icons"
	alias lcid="eza ${stdopts} --across --icons --only-dirs"
	alias lcaa="eza ${stdopts} --across --all --binary --all"
	alias lcad="eza ${stdopts} --across --all --binary --only-dirs"
	alias lcai="eza ${stdopts} --across --all --binary --icons"
	alias lcaid="eza ${stdopts} --across --all --binary --icons --only-dirs"
	alias lcaad="eza ${stdopts} --across --all --binary --all --only-dirs"
	alias lcaai="eza ${stdopts} --across --all --binary --all --icons"
	alias lcaaid="eza ${stdopts} --across --all --binary --all --icons --only-dirs"

	# le alias
	alias le="eza ${stdopts} --long --extended"
	alias lea="eza ${stdopts} --long --extended --all --binary"
	alias led="eza ${stdopts} --long --extended --only-dirs"
	alias lei="eza ${stdopts} --long --extended --icons"
	alias leid="eza ${stdopts} --long --extended --icons --only-dirs"
	alias leaa="eza ${stdopts} --long --extended --all --binary --all"
	alias lead="eza ${stdopts} --long --extended --all --binary --only-dirs"
	alias leai="eza ${stdopts} --long --extended --all --binary --icons"
	alias leaid="eza ${stdopts} --long --extended --all --binary --icons --only-dirs"
	alias leaad="eza ${stdopts} --long --extended --all --binary --all --only-dirs"
	alias leaai="eza ${stdopts} --long --extended --all --binary --all --icons"
	alias leaaid="eza ${stdopts} --long --extended --all --binary --all --icons --only-dirs"

	# lg alias
	alias lg="eza ${stdopts} --long --git --git-ignore"
	alias lga="eza ${stdopts} --long --git --git-ignore --all --binary"
	alias lgd="eza ${stdopts} --long --git --git-ignore --only-dirs"
	alias lgi="eza ${stdopts} --long --git --git-ignore --icons"
	alias lgid="eza ${stdopts} --long --git --git-ignore --icons --only-dirs"
	alias lgaa="eza ${stdopts} --long --git --git-ignore --all --binary --all"
	alias lgad="eza ${stdopts} --long --git --git-ignore --all --binary --only-dirs"
	alias lgai="eza ${stdopts} --long --git --git-ignore --all --binary --icons"
	alias lgaid="eza ${stdopts} --long --git --git-ignore --all --binary --icons --only-dirs"
	alias lgaad="eza ${stdopts} --long --git --git-ignore --all --binary --all --only-dirs"
	alias lgaai="eza ${stdopts} --long --git --git-ignore --all --binary --all --icons"
	alias lgaaid="eza ${stdopts} --long --git --git-ignore --all --binary --all --icons --only-dirs"

	# ll alias
	alias ll="eza ${stdopts} --long"
	alias lla="eza ${stdopts} --long --all --binary"
	alias lld="eza ${stdopts} --long --only-dirs"
	alias lli="eza ${stdopts} --long --icons"
	alias llid="eza ${stdopts} --long --icons --only-dirs"
	alias llaa="eza ${stdopts} --long --all --binary --all"
	alias llad="eza ${stdopts} --long --all --binary --only-dirs"
	alias llai="eza ${stdopts} --long --all --binary --icons"
	alias llaid="eza ${stdopts} --long --all --binary --icons --only-dirs"
	alias llaad="eza ${stdopts} --long --all --binary --all --only-dirs"
	alias llaai="eza ${stdopts} --long --all --binary --all --icons"
	alias llaaid="eza ${stdopts} --long --all --binary --all --icons --only-dirs"

	# lo alias
	alias lo="eza ${stdopts} --oneline"
	alias loa="eza ${stdopts} --oneline --all --binary"
	alias lod="eza ${stdopts} --oneline --only-dirs"
	alias loi="eza ${stdopts} --oneline --icons"
	alias loid="eza ${stdopts} --oneline --icons --only-dirs"
	alias loaa="eza ${stdopts} --oneline --all --binary --all"
	alias load="eza ${stdopts} --oneline --all --binary --only-dirs"
	alias loai="eza ${stdopts} --oneline --all --binary --icons"
	alias loaid="eza ${stdopts} --oneline --all --binary --icons --only-dirs"
	alias loaad="eza ${stdopts} --oneline --all --binary --all --only-dirs"
	alias loaai="eza ${stdopts} --oneline --all --binary --all --icons"
	alias loaaid="eza ${stdopts} --oneline --all --binary --all --icons --only-dirs"

	# lt alias
	alias lt="eza ${stdopts} --tree --level 4"
	alias lta="eza ${stdopts} --tree --level 4 --all --binary"
	alias ltd="eza ${stdopts} --tree --level 4 --only-dirs"
	alias lti="eza ${stdopts} --tree --level 4 --icons"
	alias ltid="eza ${stdopts} --tree --level 4 --icons --only-dirs"
	alias ltaa="eza ${stdopts} --tree --level 4 --all --binary --all"
	alias ltad="eza ${stdopts} --tree --level 4 --all --binary --only-dirs"
	alias ltai="eza ${stdopts} --tree --level 4 --all --binary --icons"
	alias ltaid="eza ${stdopts} --tree --level 4 --all --binary --icons --only-dirs"
	alias ltaad="eza ${stdopts} --tree --level 4 --all --binary --all --only-dirs"
	alias ltaai="eza ${stdopts} --tree --level 4 --all --binary --all --icons"
	alias ltaaid="eza ${stdopts} --tree --level 4 --all --binary --all --icons --only-dirs"
fi
