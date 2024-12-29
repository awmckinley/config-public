{
  isDarwin,
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
      # all-in-one cross-platform voice and text chat for gamers
      discord
    ];
}
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # all-in-one cross-platform voice and text chat for gamers
    "discord"
  ];
}
