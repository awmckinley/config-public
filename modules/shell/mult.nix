{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # run a command multiple times and glance at the outputs via a TUI
    mult
  ];
}
