{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # blocks all keyboard and touchbar input
    "keyboardcleantool"
  ];
}
