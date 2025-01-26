{
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.brews = [
    # implements Wake On LAN
    "wakeonlan"
  ];
}
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # implements Wake On LAN
    wol
  ];
}
