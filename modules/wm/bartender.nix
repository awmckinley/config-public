{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # menu bar icon organiser
    "Bartender" = 153;
  };
}
