#!/usr/bin/env -S just --justfile

set shell := ["nu", "-c"]

[doc("list available recipes")]
help:
    @just --list

[doc("update host to target state")]
apply:
    @chezmoi --verbose apply

[doc("diff target and destination states")]
diff:
    @chezmoi diff

[doc("check for potential problems")]
doctor:
    @chezmoi doctor

[doc("format Nix files")]
[group("fmt")]
fmt-nix:
    rm -f ./result
    nix fmt

[doc("format shell scripts")]
[group("fmt")]
fmt-sh:
    fd -H -e bash -x shfmt -w {}
    fd -H -e sh -x shfmt -w {}
    fd -H -e zsh -x shfmt -w {}

[doc("launch Nix repl")]
repl:
    @nix repl --expr $"builtins.getFlake \"($env.PWD)\""
