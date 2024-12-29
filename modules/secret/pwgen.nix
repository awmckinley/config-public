{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # creates passwords which can be easily memorized by a human
    # replaces: apg
    pwgen
  ];
}
