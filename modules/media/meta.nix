{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # tag editor for digital music
    # replaces: iMusic, Jaikoz, Mp3tag, MusicBee, Yate
    "Meta" = 389;
  };
}
