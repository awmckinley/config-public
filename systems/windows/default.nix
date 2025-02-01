{ inputs, ... }:
{
  imports = [
    inputs.base16.nixosModule
    inputs.determinate.nixosModules.default
    inputs.disko.nixosModules.disko
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-wsl.nixosModules.wsl
    ../../modules
  ];

  disko.devices = {
    disk = {
      home = {
        type = "disk";
        device = "/dev/sdd";
        content = {
          type = "gpt";
          partitions = {
            home = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home2";
              };
            };
          };
        };
      };
    };
  };

  # enable nix-ld
  programs.nix-ld.enable = true;

  # members of the wheel group do not need a password
  security.sudo.wheelNeedsPassword = false;

  wsl = {
    # enable support for WSL
    enable = true;

    # default user
    defaultUser = "adam";

    # enable Docker Desktop integration
    docker-desktop.enable = true;

    # disable shortcuts in the start menu
    startMenuLaunchers = false;

    # enable OpenGL driver from the Windows host
    useWindowsDriver = true;

    wslConf = {
      # mount Windows drives under /mnt
      automount.root = "/mnt";

      # include Windows PATH
      interop.appendWindowsPath = false;

      # do not generate /etc/hosts through WSL
      network.generateHosts = false;
    };
  };
}
