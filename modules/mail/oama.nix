{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # oauth credential manager
    oama
  ];
}
