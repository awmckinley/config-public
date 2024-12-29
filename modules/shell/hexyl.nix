{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # command-line hex viewer
    # replaces: xxd
    hexyl
  ];
}
