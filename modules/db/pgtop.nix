{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # a PostgreSQL clone of mytop
    pgtop
  ];
}
