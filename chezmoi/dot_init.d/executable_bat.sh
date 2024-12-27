#!/usr/bin/env bash

if command -v bat >/dev/null 2>&1; then
	# rebuild themes
	bat cache --build
fi
