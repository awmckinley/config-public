{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # convert line breaks
    dos2unix
  ];
}
