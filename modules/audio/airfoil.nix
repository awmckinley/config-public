{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # sends audio from computer to outputs
    "airfoil"
  ];
}
