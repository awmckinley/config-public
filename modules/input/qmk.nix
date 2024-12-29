{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # program to help users work with QMK Firmware
    qmk
  ];
}
