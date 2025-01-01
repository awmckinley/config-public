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
    # allows to quickly and easily compare files and folders
    "beyond-compare"
  ];
}
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # allows to quickly and easily compare files and folders
    bcompare
  ];
}
