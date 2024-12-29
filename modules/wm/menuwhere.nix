{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # access the menu from anywhere
    "menuwhere"
  ];
}
