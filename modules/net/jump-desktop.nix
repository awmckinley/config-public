{
  isDarwin,
  lib,
  remoteDesktop,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  setapp.apps = {
    # remote desktop application
    # replaces: RustDesk
    "Jump Desktop" = 75;
  };
}
// lib.optionalAttrs (isDarwin && remoteDesktop) {
  homebrew.casks = [
    # remote desktop app
    # replaces: RustDesk
    "jump-desktop-connect"
  ];
}
