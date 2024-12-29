{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # converts and edits video, audio or image files
    "Permute" = 219;
  };
}
