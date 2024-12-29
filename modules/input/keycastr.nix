{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # open-source keystroke visualiser
    "keycastr"
  ];
}
