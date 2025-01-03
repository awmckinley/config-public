#!/usr/bin/env bash

if test "$(uname -s)" != 'Darwin'; then
	echo 'Skipping darwin.sh...'
fi

# Rosetta (x64 layer for M1)
if test "$(uname -m)" = 'arm64'; then
	# Check whether osascript runs in x86 mode
	if ! arch -x86_64 osascript -e '0' &>/dev/null; then
		echo 'Install Rosetta'
		sudo softwareupdate --install-rosetta --agree-to-license
		echo ''
	fi
fi

# Locate db service
if ! launchctl print system | grep -q 'com.apple.locate'; then
	echo 'Load locate service'
	sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
	echo ''
fi
