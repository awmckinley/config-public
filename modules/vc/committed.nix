{
  isLinux,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [ ]
    ++ lib.optionals isLinux [
      # linting for your git commit messages
      # replaces: commitlint, gitlint
      committed
    ];
}
