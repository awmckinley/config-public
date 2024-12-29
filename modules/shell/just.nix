{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # handy way to save and run project-specific commands
    just
  ];
}
