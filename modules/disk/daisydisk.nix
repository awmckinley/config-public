{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.masApps = {
    # recover disk space
    # replaces: Disk Inventory X, OmniDiskSweeper
    "DaisyDisk" = 411643860;
  };
}
