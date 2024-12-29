{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # free and open source utility for network discovery and security auditing
    nmap
  ];
}
