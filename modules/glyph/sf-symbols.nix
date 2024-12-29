{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # provides consistent, highly configurable symbols for apps
    "sf-symbols"
  ];
}
