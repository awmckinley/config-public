if command -v git >/dev/null 2>&1; then
	# Git aliases <https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh>
	alias g='git'

	# Add
	alias ga='git add'
	alias gaa='git add --all'

	# Commit
	alias gcmsg='git commit --message'

	# Diff
	alias gd='git diff'
	alias gdca='git diff --cached'

	# Pull
	alias gpr='git pull --rebase'

	# Push
	alias gp='git push'
	alias gpsup='git push --set-upstream origin $(git_current_branch)'

	# Remote
	alias gr='git remote'
	alias gra='git remote add'
	alias grset='git remote set-url'

	# Remove
	alias grm='git rm'
	alias grmc='git rm --cached'

	# Status
	alias gst='git status'
fi
