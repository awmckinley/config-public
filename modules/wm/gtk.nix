{
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # C library of programming buildings blocks
    glib

    # style neutral scalable cursor theme
    vanilla-dmz
  ];

  # simple key/value storage system
  programs.dconf.enable = true;

  xdg.portal = {
    # xdg desktop integration
    enable = true;

    # which portal backends to use
    config.common.default = [ "gtk" ];

    extraPortals = with pkgs; [
      # desktop integration portals for sandboxed apps
      xdg-desktop-portal-gtk
    ];
  };
}
