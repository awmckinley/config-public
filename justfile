#!/usr/bin/env -S just --justfile

set shell := ["nu", "-c"]

[doc("list available recipes")]
help:
    @just --list

[doc("update host to target state")]
[group("chezmoi")]
apply:
    @chezmoi apply --verbose

[doc("diff target and destination states")]
[group("chezmoi")]
diff:
    @chezmoi diff

[doc("check for potential problems")]
[group("chezmoi")]
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
[group("nix")]
repl:
    @nix repl --expr $"builtins.getFlake \"($env.PWD)\""

[doc("pull and apply changes")]
[group("chezmoi")]
update:
    @chezmoi update --verbose
