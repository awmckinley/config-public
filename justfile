#!/usr/bin/env -S just --justfile

set shell := ["nu", "-c"]

[doc("list available recipes")]
help:
    @just --list

[doc("update host to target state")]
[group("chezmoi")]
apply:
    @chezmoi apply --verbose

[doc("boot new generation")]
[group("nix")]
boot: (_machine "boot")

[doc("build new generation")]
[group("nix")]
build: (_machine "build")

[doc("diff target and destination states")]
[group("chezmoi")]
diff:
    @chezmoi diff

[doc("check for potential problems")]
[group("chezmoi")]
doctor:
    @chezmoi doctor

[doc("format files")]
[group("nix")]
fmt:
    @rm -f ./result
    @nix fmt

[doc("re-add modified files")]
[group("chezmoi")]
re-add:
    @chezmoi re-add

[doc("launch Nix repl")]
[group("nix")]
repl:
    @nix repl --expr $"builtins.getFlake \"($env.PWD)\""

[doc("switch to new generation")]
[group("nix")]
switch: (_machine "switch")

[doc("test new generation")]
[group("nix")]
test: (_machine "test")

[doc("pull and apply changes")]
[group("chezmoi")]
update:
    @chezmoi update --verbose

[linux]
_machine operation:
    @sudo nixos-rebuild '{{ operation }}' --flake $"($env.PWD)"

[macos]
_machine operation:
    @nix run nix-darwin -- '{{ operation }}' --flake $"($env.PWD)"
