{
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # wrapper around podman or docker to create and start containers
    distrobox

    # unofficial GUI for managing your Distroboxes
    boxbuddy
  ];
}
