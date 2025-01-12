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
    # fast, native, feature-rich terminal emulator
    "ghostty"
  ];
}
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # fast, native, feature-rich terminal emulator
    ghostty
  ];
}
