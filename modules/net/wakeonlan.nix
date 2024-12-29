{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # script for waking up computers via Wake-On-LAN magic packets
    wakeonlan
  ];
}
