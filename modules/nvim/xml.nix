{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # XML language server
    lemminx

    # XML parsing library for C
    libxml2
  ];
}
