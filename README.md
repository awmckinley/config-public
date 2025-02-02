# config-public

My personal configuration.

## Linux/MacOS

```sh
# Set up a new machine
chezmoi init awmckinley/config-public --apply --source "${HOME}/Code/github.com/awmckinley/config-public" --verbose
```

## Windows

```powershell
# Set up a new machine
chezmoi init awmckinley/config-public --apply --source "D:/github.com/awmckinley/config-public" --verbose
```

### NixOS on WSL

```powershell
wsl --install --no-distribution
wsl --import NixOS $env:USERPROFILE\NixOS\ nixos-wsl.tar.gz --version 2
New-Vhd -Dynamic -SizeBytes 100gb -BlockSizeBytes 1mb -Path $env:USERPROFILE\NixOS\home.vhdx
wsl --mount --vhd $env:USERPROFILE\NixOS\home.vhdx --bare
wsl -d NixOS
```
