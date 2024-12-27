#!/usr/bin/env bash

if command -v tailscale >/dev/null 2>&1; then
	if ! tailscale status --peers=false; then
		tailscale up
	fi
fi
