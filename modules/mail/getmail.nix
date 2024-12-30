{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # program for retrieving mail
    getmail6
  ];
}
