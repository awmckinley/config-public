{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # modern, maintained replacement for ls
    # replaces: colorls, exa, ls, lsd
    eza
  ];
}
