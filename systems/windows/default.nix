{ inputs, pkgs, ... }:
{
  imports = [
    inputs.base16.nixosModule
    inputs.determinate.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-wsl.nixosModules.wsl
    ../../modules
  ];

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
