{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # tool to flash OS images to SD cards & USB drives
    "balenaetcher"
  ];
}
