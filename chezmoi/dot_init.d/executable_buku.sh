#!/usr/bin/env bash

if test-darwin; then
	echo 'Skip on Darwin'
	exit 0
fi

if command -v bukubrow >/dev/null 2>&1; then
	if ! test -f "${HOME}/.config/BraveSoftware/Brave-Browser/NativeMessagingHosts/com.samhh.bukubrow.json"; then
		bukubrow --install-brave
	fi
fi
