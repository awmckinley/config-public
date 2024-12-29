{
  config,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # test utilities for OpenGL
    glxinfo

    # small X utility to perform elementary actions on windows
    xdo

    # X event viewer
    xorg.xev

    # X Window System initializer
    xorg.xinit

    # utility for modifying keymaps and pointer button mappings in X
    xorg.xmodmap

    # root window parameter setting utility for X
    xorg.xsetroot

    # terminal emulator for the X Window System
    xterm
  ];

  # hardware accelerated graphics
  hardware.graphics.enable = true;

  services.xrdp = {
    # open source RDP server
    enable = true;

    # window manager
    defaultWindowManager = "startx";

    # allow access
    openFirewall = true;
  };

  services.xserver = {
    # X server
    enable = true;

    # X Window System initializer
    displayManager.startx.enable = true;

    # use NVIDIA driver
    videoDrivers = [ "nvidia" ];

    # X keyboard layout
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
