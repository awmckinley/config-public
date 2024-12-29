{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # control your tools with a few keystrokes
    # replaces: Alfred, Launchbar, Loungy, Quicksilver
    "raycast"
  ];

  system.defaults.CustomUserPreferences = {
    "com.raycast.macos" = {
      raycastPreferredWindowMode = "compact";
      raycastShouldFollowSystemAppearance = 1;
      showFavoritesInCompactMode = 0;
    };
  };
}
