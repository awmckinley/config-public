{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # tool to control external monitor brightness & volume
    # replaces: brightness, QuickShade
    "monitorcontrol"
  ];
}
