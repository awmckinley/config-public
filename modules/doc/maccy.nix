{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # clipboard manager
    # replaces: Pasta
    "maccy"
  ];
}
