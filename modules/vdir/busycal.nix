{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # calendar software focusing on flexibility and reliability
    # replaces: Apple, Calendar 366, Dato, Fantastical, Readdle, WallCal
    "BusyCal" = 304;
  };
}
