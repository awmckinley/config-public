{ inputs, pkgs, ... }:
{
  imports = [
    inputs.base16.nixosModule
    inputs.home-manager.nixosModules.home-manager
    ../../modules
  ];

  boot = {
    loader = {
      # allow installation to modify EFI boot variables
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        # systemd-boot EFI boot manager
        enable = true;

        # use heuristics for console resolution
        consoleMode = "auto";

        # disable editing kernel command-line
        editor = false;
      };
    };

    plymouth = {
      # Plymouth boot splash screen
      enable = true;
    };
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # NetworkManager
  networking.networkmanager.enable = true;

  # Bluetooth manager
  services.blueman.enable = true;

  # continue immediately
  systemd.services.NetworkManager-wait-online = {
    serviceConfig = {
      ExecStart = [
        ""
        "${pkgs.networkmanager}/bin/nm-online -q"
      ];
    };
  };
}
