{
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # cross-platform tools for Matroska
    "mkvtoolnix"
  ];
}
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # cross-platform tools for Matroska
    mkvtoolnix
  ];
}
