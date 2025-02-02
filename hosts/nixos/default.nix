{ inputs, pkgs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
    ../../systems/windows
    ../../users/adam
    ./disko-config.nix
  ];

  # machine name
  networking.hostName = "nixos";

  # use the Tokyo Night scheme
  schemeDark = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  schemeLight = "${pkgs.base16-schemes}/share/themes/tokyo-night-light.yaml";

  # first version installed on this machine
  system.stateVersion = "22.05";

  # time zone
  time.timeZone = "America/Chicago";
}
