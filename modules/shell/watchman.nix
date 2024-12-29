{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # watches files and takes action when they change
    watchman
  ];
}
