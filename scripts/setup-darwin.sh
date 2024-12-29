#!/usr/bin/env bash
#
# Set up Darwin prerequisites.

set -o errexit  # exit if any command fails
set -o nounset  # prevent using an undefined variable
set -o pipefail # pipelines fail early
IFS=$'\n\t'

if test "$(uname -s)" != Darwin; then
	echo 'WARN: Skipping Darwin-only init.'
	exit 1
fi

# paths
brew_intel=/usr/local/bin/brew
brew_m1=/opt/homebrew/bin/brew
xcode=/Applications/Xcode.app/Contents/Developer

if command -v xcode-select >/dev/null 2>&1; then
	# Xcode: xcodebuild requires Xcode
	if test "$(xcode-select --print-path)" != "$xcode"; then
		echo 'Switch to Xcode'
		sudo xcode-select --switch "$xcode"
		echo ''
	fi
fi

if command -v xcodebuild >/dev/null 2>&1; then
	echo 'Update system content'
	xcodebuild -runFirstLaunch
	echo ''
fi

# Homebrew: install
if test ! -x "$brew_intel" && test ! -x "$brew_m1"; then
	echo 'Install Homebrew'
	curl -fsSL 'https://raw.githubusercontent.com/Homebrew/install/master/install.sh' | bash
	echo ''
fi

# Nix: install w/ Determinate Nix
if test ! -h /nix/var/nix/profiles/default; then
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
fi

# Nix: fix certs
if ! test -e /etc/ssl/certs/ca-certificates.crt; then
	sudo rm -f /etc/ssl/certs/ca-certificates.crt
	sudo ln -s /nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt /etc/ssl/certs/ca-certificates.crt
fi

# Nix: source Nix environment
if test -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh; then
	. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

# Nix: provision nix-channels
if ! test -d "${HOME}/.nix-channels"; then
	nix-channel --add https://nixos.org/channels/nixpkgs-24.05-darwin nixpkgs
	nix-channel --update
fi
