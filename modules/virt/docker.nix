{ isDarwin, isLinux, lib, ... }:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # replacement for Docker Desktop
    "orbstack"
  ];
}
// lib.optionalAttrs isLinux {
  # pack, ship and run any application as a lightweight container
  virtualisation.docker = {
    autoPrune.enable = true;
    enable = true;
    enableOnBoot = true;
  };
}
