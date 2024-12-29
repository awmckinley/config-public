{
  isDarwin,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  # highly customizable macOS status bar replacement
  # replaces: spacebar
  services.sketchybar.enable = true;

  environment.systemPackages = with pkgs; [
    # dependencies
    jq
  ];
}
