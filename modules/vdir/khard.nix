{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # console CardDAV client
    # replaces: mates.rs
    khard
  ];
}
