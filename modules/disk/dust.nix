{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # like du but more intuitive
    # replaces: du, dua, ncdu
    dust
  ];
}
