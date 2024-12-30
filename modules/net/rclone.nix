{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # command line program to sync files and directories to and from major cloud storage
    rclone
  ];
}
