{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # simple tool for making locally-trusted development certificates
    mkcert
  ];
}
