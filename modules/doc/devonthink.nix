{
  isDarwin,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # collect, organise, edit and annotate documents
    # replaces: EagleFiler
    "devonthink"
  ];
}
