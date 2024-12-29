{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # fast, local neural text to speech system
    piper-phonemize
    piper-tts
  ];
}
