{
  config,
  isLinux,
  lib,
  ...
}:
{ }
// lib.optionalAttrs isLinux {
  # Xfce desktop environment
  services.xserver.desktopManager.xfce.enable = config.desktop == "xfce";
}
