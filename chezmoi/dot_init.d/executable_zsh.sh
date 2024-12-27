#!/usr/bin/env bash

zgenom="${HOME}/.zgenom"
if test ! -d "$zgenom"; then
	echo 'Setup zgenom'
	git clone --single-branch https://github.com/jandamm/zgenom.git --depth 1 "$zgenom"
	echo ''
fi
