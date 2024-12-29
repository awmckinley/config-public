{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # produce a depth indented directory listing
    # replaces: eza --tree, tree
    tree
  ];
}
