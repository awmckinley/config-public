{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # terminal graphics for the 21st century
    # replaces: catimg, timg, viu
    chafa
  ];
}
