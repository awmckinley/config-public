{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # contact manager focusing on efficiency
    "BusyContacts" = 369;
  };
}
