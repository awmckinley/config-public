{
  config,
  isDarwin,
  lib,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  homebrew =
    { }
    // lib.optionalAttrs (config.desktop == "aerospace") {
      taps = [ "nikitabobko/tap" ];
      casks = [
        # i3-like tiling window manager for macOS
        "nikitabobko/tap/aerospace"
      ];
    };
}
