{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # very fast implementation of tldr in Rust
    # replaces: tldr, tlrc
    tealdeer
  ];
}
