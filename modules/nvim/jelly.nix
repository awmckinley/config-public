{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.taps = [ "jellycuts/formulae" ];
  homebrew.brews = [
    # scripting language for Shortcuts
    "jellycuts/formulae/jelly"
  ];
}
