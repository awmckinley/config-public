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
