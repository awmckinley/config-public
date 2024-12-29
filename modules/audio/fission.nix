{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # audio editor
    # replaces: Audacity
    "fission"
  ];
}
