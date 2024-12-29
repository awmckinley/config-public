# M-i for tmux-menu
bindkey -s '^[i' "tmux-menu"

# left hand
bindkey -s '^[u' "tmux-menu \$(tmux-mark u)"
bindkey -s '^[e' "tmux-menu \$(tmux-mark e)"
bindkey -s '^[o' "tmux-menu \$(tmux-mark o)"
bindkey -s '^[a' "tmux-menu \$(tmux-mark a)"
