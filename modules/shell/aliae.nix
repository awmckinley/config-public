{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # cross shell and platform alias management
    aliae
  ];
}
