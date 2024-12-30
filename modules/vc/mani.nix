{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # CLI tool to help you manage multiple repositories
    # replaces: gitbatch, mr, vcstool
    mani
  ];
}
