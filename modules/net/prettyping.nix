{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # wrapper around the standard ping tool
    # replaces: gping, ping
    prettyping
  ];
}
