{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # execute scripts on IMAP mailbox changes using IDLE
    goimapnotify
  ];
}
// lib.optionalAttrs isDarwin {
  launchd.user.agents.goimapnotify = {
    path = [ config.environment.systemPath ];
    serviceConfig = {
      KeepAlive = true;
      ProcessType = "Interactive";
      ProgramArguments = [ "${pkgs.goimapnotify}/bin/goimapnotify" ];
      StandardErrorPath = "/tmp/goimapnotify.log";
      StandardOutPath = "/tmp/goimapnotify.log";
    };
  };
}
