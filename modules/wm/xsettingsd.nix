{
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # provides settings to X11 applications via the XSETTINGS specification
    # replaces: gnome-settings-daemon
    xsettingsd
  ];
}
