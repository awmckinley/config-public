{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # developer-oriented browser
    # replaces: Responsively
    "blisk"
  ];
}
