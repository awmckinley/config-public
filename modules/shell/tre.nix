{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tree command, improved
    # replaces: eza --tree, tree
    tre-command
  ];
}
