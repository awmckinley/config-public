{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # records audio from any application
    "audio-hijack"
  ];
}
