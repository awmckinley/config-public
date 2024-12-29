{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # screen capturing tool
    # cleanshot replaces: Droplr, Loom, Shottr
    "CleanShot X" = 321;
  };
}
