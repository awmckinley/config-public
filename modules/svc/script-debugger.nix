{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # integrated development environment focused entirely on AppleScript
    "script-debugger"
  ];
}
