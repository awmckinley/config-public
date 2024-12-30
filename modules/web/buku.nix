{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # private cmdline bookmark manager
    buku

    # WebExtension for Buku, a command-line bookmark manager
    bukubrow
  ];
}
