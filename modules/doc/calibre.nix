{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # comprehensive e-book software
    "calibre"
  ];
}
