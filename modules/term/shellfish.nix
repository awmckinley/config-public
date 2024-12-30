{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.masApps = {
    # powerful SSH terminal for iOS & Mac
    "ShellFish" = 1336634154;
  };
}
