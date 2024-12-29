{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tool for monitoring webpages for updates
    urlwatch
  ];
}
