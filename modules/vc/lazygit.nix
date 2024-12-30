{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # simple terminal UI for Git commands
    # replaces: gitui
    lazygit
  ];
}
