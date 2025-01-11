{ isLinux, lib, ... }:
{ }
// lib.optionalAttrs isLinux {
  # pack, ship and run any application as a lightweight container
  virtualisation.docker = {
    autoPrune.enable = true;
    enable = true;
    enableOnBoot = true;
  };
}
