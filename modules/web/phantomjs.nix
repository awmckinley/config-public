{ isDarwin, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # headless web browser
    "phantomjs"
  ];
}
