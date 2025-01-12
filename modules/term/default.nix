{ isLinux, lib, ... }:
{
  imports = [
    ./ghostty.nix
    ./shellfish.nix
    ./tmux.nix
    ./wezterm.nix
  ];
}
// lib.optionalAttrs isLinux {
  # install all terminfo outputs
  environment.enableAllTerminfo = true;
}
