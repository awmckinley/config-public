#!/usr/bin/env bash

if ! test -x "${HOME}/.cargo/bin/burntcookie"; then
	echo 'Install burntcookie'
	cargo install --git https://github.com/horrorho/burnt-cookie.git
	echo ''
fi
