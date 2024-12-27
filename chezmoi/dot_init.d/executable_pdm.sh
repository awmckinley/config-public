#!/usr/bin/env bash

if command -v pdm >/dev/null 2>&1; then
	pdm config venv.backend venv
fi
