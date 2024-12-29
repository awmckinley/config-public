{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # two-factor authentication software
    "authy"
  ];
}
