{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # CLI calendar application
    # replaces: calcure, calcurse, when
    khal
  ];
}
