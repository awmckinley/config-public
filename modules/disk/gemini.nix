{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # find and remove duplicates
    "Gemini" = 79;
  };
}
