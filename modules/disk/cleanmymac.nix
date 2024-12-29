{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # tool to remove unnecessary files and folders from disk
    "CleanMyMac" = 78;
  };
}
