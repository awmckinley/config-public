{
  isLinux,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [ ]
    ++ lib.optionals isLinux [
      # fast, local neural text to speech system
      piper-phonemize
      piper-tts
    ];
}
