{
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # tool for converting video files and ripping DVDs
    "handbrake"
  ];
}
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # tool for converting video files and ripping DVDs
    handbrake
  ];
}
