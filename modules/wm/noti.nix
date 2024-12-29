{
  isLinux,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
      # monitor a process and trigger a notification
      noti
    ]
    ++ lib.optionals isLinux [
      # send desktop notifications to a notification daemon
      libnotify
    ];
}
