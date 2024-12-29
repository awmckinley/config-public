{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tool for retrieving files using HTTP, HTTPS, and FTP
    wget
  ];
}
