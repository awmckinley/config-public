{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # GNU core utilities
    coreutils
  ];
}
