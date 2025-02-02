{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../systems/linux
    ../../users/adam
  ];

  hardware.nvidia = {
    # use closed source kernel module
    open = false;

    # use stable driver for GTX 1660 SUPER (6GB)
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # machine name
  networking.hostName = "niobium";

  # use the Tokyo Night scheme
  schemeDark = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  schemeLight = "${pkgs.base16-schemes}/share/themes/tokyo-night-light.yaml";

  # first version installed on this machine
  system.stateVersion = "24.05";

  # time zone
  time.timeZone = "America/Chicago";
}
