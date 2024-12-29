{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # generator for LS_COLORS with support for multiple color themes
    vivid
  ];
}
