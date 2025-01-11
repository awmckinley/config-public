_: {
  imports = [
    ./shellfish.nix
    ./tmux.nix
    ./wezterm.nix
  ];

  # install all terminfo outputs
  environment.enableAllTerminfo = true;
}
