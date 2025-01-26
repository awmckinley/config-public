{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # implements Wake On LAN
    wol
  ];
}
