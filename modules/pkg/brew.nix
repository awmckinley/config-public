{
  isDarwin,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  # add homebrew to the PATH
  environment.systemPath = [
    (if pkgs.stdenv.hostPlatform.isAarch64 then "/opt/homebrew/bin" else "/usr/local/bin")
  ];

  homebrew = {
    # package manager for macOS
    enable = true;

    onActivation = {
      # auto-update Homebrew and formulae
      autoUpdate = true;

      # uninstall removed formulae and remove associated files
      cleanup = "zap";

      # upgrade outdated formulae and Mac App Store apps
      upgrade = true;
    };
  };
}
