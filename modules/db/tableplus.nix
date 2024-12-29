{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # query, edit, and manage databases
    "TablePlus" = 297;
  };
}
