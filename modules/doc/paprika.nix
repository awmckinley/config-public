{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.masApps = {
    # organize your recipes
    # replaces: Reciper
    "Paprika Recipe Manager 3" = 1303222628;
  };
}
