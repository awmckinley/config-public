{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # terminal audio visualizer
    # replaces: cava
    catnip
  ];
}
