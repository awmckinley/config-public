{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Autotools language server
    autotools-language-server
  ];
}
