{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.base16.nixosModule
    inputs.determinate.nixosModules.default
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

  console = {
    # virtual console
    enable = true;

    # colors palette
    colors = with config.darkScheme; [
      base00
      red
      green
      brown # brown or orange
      blue
      magenta
      cyan
      base05
      base03
      bright-red
      bright-green
      yellow # yellow or bright-orange
      bright-blue
      bright-magenta
      bright-cyan
      base06
    ];

    # setup as early as possible
    earlySetup = true;

    # font for virtual consoles
    font = "${pkgs.terminus_font}/share/consolefonts/ter-i14b.psf.gz";

    # additional packages
    packages = [ pkgs.terminus_font ];
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
