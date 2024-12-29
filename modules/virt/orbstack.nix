{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # replacement for Docker Desktop
    "orbstack"
  ];
}
