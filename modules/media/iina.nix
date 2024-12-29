{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # modern media player for macOS
    "iina"
  ];
}
