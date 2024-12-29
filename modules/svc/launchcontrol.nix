{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # create, manage and debug system and user services
    # replaces: Lingon X
    "launchcontrol"
  ];
}
