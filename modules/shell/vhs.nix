{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tool for generating terminal GIFs with code
    # replaces: asciinema, ovh-ttyrec, ttygif
    vhs

    # vhs dependencies
    ffmpeg
    ttyd
  ];
}
