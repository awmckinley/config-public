{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # fast incremental file transfer utility
    rsync
  ];
}
