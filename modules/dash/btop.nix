{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # monitor of resources
    # replaces: bashtop, bottom, bpytop, glances, gotop, htop
    btop
  ];
}
