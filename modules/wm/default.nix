{
  isDarwin,
  lib,
  ...
}:
{
  imports = [
    ./aerospace.nix
    ./bartender.nix
    ./borders.nix
    ./darkman.nix
    ./dex.nix
    ./dunst.nix
    ./greetd.nix
    ./gtk.nix
    ./hammerspoon.nix
    ./i3.nix
    ./menuwhere.nix
    ./monitorcontrol.nix
    ./noti.nix
    ./pcmanfm.nix
    ./raycast.nix
    ./rofi.nix
    ./sketchybar.nix
    ./xfce.nix
    ./xorg.nix
    ./xsettingsd.nix
    ./yabai.nix
  ];

  options = {
    desktop = lib.options.mkOption {
      default = if isDarwin then "aerospace" else "i3";
      description = "Desktop environment to use";
      type = lib.types.enum [
        "aerospace"
        "i3"
        "xfce"
        "yabai"
      ];
    };
  };
}
