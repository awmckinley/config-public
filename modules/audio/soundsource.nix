{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # sound and audio controller
    # replaces: Background Music, eqMac
    "soundsource"
  ];
}
