{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # tool for running time-saving scripts
    "fastscripts"
  ];
}
