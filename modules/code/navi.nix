{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # interactive cheatsheet tool for the command-line and application launchers
    navi
  ];
}
