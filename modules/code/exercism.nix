{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # command line tool for exercism.io
    exercism
  ];
}
