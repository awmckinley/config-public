{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # simple, fast and user-friendly alternative to find
    # replaces: find
    fd
  ];
}
