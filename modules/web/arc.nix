{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # Chromium based browser
    "arc"
  ];
}
