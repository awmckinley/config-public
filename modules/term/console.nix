{
  config,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isLinux {
  console = {
    # virtual console
    enable = true;

    # colors palette
    colors = with config.darkScheme; [
      base00
      red
      green
      brown # brown or orange
      blue
      magenta
      cyan
      base05
      base03
      bright-red
      bright-green
      yellow # yellow or bright-orange
      bright-blue
      bright-magenta
      bright-cyan
      base06
    ];

    # setup as early as possible
    earlySetup = true;

    # font for virtual consoles
    font = "${pkgs.terminus_font}/share/consolefonts/ter-i14b.psf.gz";

    # additional packages
    packages = [ pkgs.terminus_font ];
  };
}
