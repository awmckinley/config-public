#!/usr/bin/env bash

if command -v opam >/dev/null 2>&1; then
	if ! test -d "${HOME}/.opam"; then
		# WARN: sandboxing not working
		opam init --disable-sandboxing --no-setup
	fi

	# source opam env
	eval "$(opam env --switch=default)"

	# disable external dependency handling
	opam option --global depext=false

	# install ocamlformat
	if ! command -v ocamlformat >/dev/null 2>&1; then
		opam install --yes ocamlformat
	fi

	# install ocamllsp
	if ! command -v ocamllsp >/dev/null 2>&1; then
		opam install --yes ocaml-lsp-server
	fi
fi
