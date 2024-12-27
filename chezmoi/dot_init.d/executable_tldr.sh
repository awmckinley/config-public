#!/usr/bin/env bash

if command -v tldr >/dev/null 2>&1; then
	# Update tldr database
	tldr --update
fi
