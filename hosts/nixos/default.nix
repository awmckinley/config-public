{
  inputs,
  pkgs,
  ...
}:
{
  environment.enableAllTerminfo = true;
  networking.hostName = "nixos";
  security.sudo.wheelNeedsPassword = false;
  system.stateVersion = "22.05";
  time.timeZone = "America/Chicago";

  wsl = {
    defaultUser = "adam";
    docker-desktop.enable = false;
    enable = true;
    startMenuLaunchers = true;
    wslConf = {
      automount.root = "/mnt";
      interop.appendWindowsPath = false;
      network.generateHosts = false;
    };
  };
}
