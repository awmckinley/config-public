{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # tool to create text-based art
    "monodraw"
  ];
}
