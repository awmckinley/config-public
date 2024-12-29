{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # highly customizable and functional PDF viewer
    # replaces: Sioyek
    zathura
  ];
}
