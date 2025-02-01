{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # sends audio from computer to outputs
    "airfoil"

    # records audio from any application
    "audio-hijack"

    # audio playback
    "farrago"

    # audio editor
    # replaces: Audacity
    "fission"

    # cable-free audio router
    "loopback"

    # audio recording application
    "piezo"

    # sound and audio controller
    # replaces: Background Music, eqMac
    "soundsource"
  ];
}
