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
    # GPU-accelerated cross-platform terminal emulator and multiplexer
    # replaces: Alacritty, Contour, iTerm2, Kitty, rxvt, st
    "wezterm"
  ];
}
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # GPU-accelerated cross-platform terminal emulator and multiplexer
    # replaces: Alacritty, Contour, iTerm2, Kitty, rxvt, st
    wezterm
  ];
}
