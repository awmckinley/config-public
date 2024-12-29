{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # filter IPv4 and IPv6 addresses matching CIDR patterns
    grepcidr
  ];
}
