{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # quickly quit one, some, or all apps
    "QuitAll" = 493;
  };

  system.defaults.CustomUserPreferences = {
    "com.quitallapp.quitall-setapp" = {
      includeFinderInList = 0;
      includeTrashInList = 0;
      skipAutoclosingMusicApps = 1;
    };
  };
}
