{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # interactive process viewer
    # replaces: top
    htop
  ];
}
