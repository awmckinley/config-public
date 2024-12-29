{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # yank terminal output to clipboard
    yank
  ];
}
