{
  config,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isLinux {
  services.xserver.windowManager.i3 = {
    # tiling window manager
    enable = config.desktop == "i3";

    extraPackages = with pkgs; [
      # automatically switch the horizontal/vertical window split orientation
      # replaces: i3a, i3altlayout, spatial-shell
      autotiling

      # fast and sweet looking lockscreen for linux systems with effects
      # replaces: i3lock, i3lock-color, i3lock-fancy
      betterlockscreen

      # flexible scheduler for your i3bar blocks
      # replaces: bumblebee-status, i3pystatus, i3status, i3status-rust
      i3blocks
    ];
  };
}
