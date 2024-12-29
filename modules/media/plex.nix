{
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # streaming media player for Plex
    "plex"

    # beautiful Plex music player for audiophiles, curators, and hipsters
    "plexamp"
  ];
}
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # streaming media player for Plex
    plex-media-player

    # beautiful Plex music player for audiophiles, curators, and hipsters
    plexamp
  ];
}
