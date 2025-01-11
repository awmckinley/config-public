_: {
  imports = [
    ../../systems/darwin
    ../../users/adam
  ];

  # machine name
  networking.hostName = "krypton";

  # platform where configuration runs
  nixpkgs.hostPlatform = "aarch64-darwin";

  # first version installed on this machine
  system.stateVersion = 5;

  # time zone
  time.timeZone = "America/Chicago";
}
