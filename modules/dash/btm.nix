{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # graphical process/system monitor with a customizable interface
    # replaces: bashtop, btop, bpytop, glances, gotop
    bottom
  ];
}
