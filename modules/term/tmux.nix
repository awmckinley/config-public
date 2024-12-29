{
  isDarwin,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
      # terminal multiplexer
      # replaces: byobu, screen, vtm, zellij
      tmux

      # tmux-menu dependencies
      fd
      fzf
    ]
    ++ lib.optionals isDarwin [
      # tmux dependencies
      reattach-to-user-namespace
    ];
}
