{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # live CSS reload & browser syncing
    nodePackages.browser-sync
  ];
}
