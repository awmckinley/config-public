{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  # tiling window manager for macOS based on binary space partitioning
  services.yabai.enable = config.desktop == "yabai";

  environment.systemPackages = with pkgs; [
    # yabai dependencies
    jq
  ];

  homebrew.casks =
    [ ]
    ++ lib.optionals isDarwin [
      # menu bar indicator showing the currently selected space
      "spaceid"
    ];
}
