{ config, pkgs, ... }:
{
  imports = [
    ../../systems/windows
    ../../users/adam
  ];

  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      ecryptfs
    ];

    kernelPatches = [
      {
        name = "fscrypt-config";
        patch = null;
        extraConfig = ''
          CONFIG_FS_ENCRYPTION y
        '';
      }
    ];
  };

  environment.systemPackages = with pkgs; [
    # high-level tool for the management of Linux filesystem encryption
    fscrypt-experimental
  ];

  # machine name
  networking.hostName = "nixos";

  # automatically mount on login
  security.pam.enableFscrypt = true;

  # use the Tokyo Night scheme
  schemeDark = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  schemeLight = "${pkgs.base16-schemes}/share/themes/tokyo-night-light.yaml";

  # first version installed on this machine
  system.stateVersion = "22.05";

  # time zone
  time.timeZone = "America/Chicago";
}
