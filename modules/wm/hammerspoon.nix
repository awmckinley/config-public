{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # desktop automation application
    "hammerspoon"
  ];
}
