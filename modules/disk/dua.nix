{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tool to conveniently learn about disk usage of directories
    # replaces: du, dust, ncdu
    dua
  ];
}
