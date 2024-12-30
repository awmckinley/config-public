{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # CHANGELOG generator
    git-chglog
  ];
}
