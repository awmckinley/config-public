{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # blazing fast terminal file manager
    # replaces: broot, lf, nnn, ranger, vifm
    yazi
  ];
}
