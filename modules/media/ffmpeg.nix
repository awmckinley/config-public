{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # record, convert and stream audio and video
    ffmpeg
  ];
}
