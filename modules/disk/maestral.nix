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
    # open-source Dropbox client
    "maestral"
  ];
}
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # open-source Dropbox client
    maestral

    # GUI front-end for maestral
    maestral-gui
  ];
}
