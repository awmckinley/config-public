{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.brews = [
    # tool for emulating mouse and keyboard events
    "cliclick"
  ];
}
