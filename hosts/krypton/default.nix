{ pkgs, ... }:
{
  imports = [
    ../../systems/darwin
    ../../users/adam
  ];

  # machine name
  networking.hostName = "krypton";

  # platform where configuration runs
  nixpkgs.hostPlatform = "aarch64-darwin";

  # use the Tokyo Night scheme
  schemeDark = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  schemeLight = "${pkgs.base16-schemes}/share/themes/tokyo-night-light.yaml";

  # first version installed on this machine
  system.stateVersion = 5;

  # time zone
  time.timeZone = "America/Chicago";
}
