{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.brews = [
    # manage the desktop wallpaper
    "wallpaper"
  ];
}
