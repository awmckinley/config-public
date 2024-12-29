{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # app that enables mouse-free UI interaction
    "shortcat"
  ];
}
