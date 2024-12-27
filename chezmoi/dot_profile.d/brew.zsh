brew_intel=/usr/local/bin/brew
brew_m1=/opt/homebrew/bin/brew

if test -x "$brew_intel"; then
	eval "$("$brew_intel" shellenv)"
elif test -x "$brew_m1"; then
	eval "$("$brew_m1" shellenv)"
fi

export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
