{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  environment.systemPackages = with pkgs; [
    # lightweight tool designed to add colored borders to user windows on macOS
    jankyborders
  ];

  launchd.user.agents.borders = {
    path = [ config.environment.systemPath ];
    serviceConfig = {
      KeepAlive = true;
      ProcessType = "Interactive";
      ProgramArguments = [ "${pkgs.jankyborders}/bin/borders" ];
      StandardErrorPath = "/tmp/borders.log";
      StandardOutPath = "/tmp/borders.log";
    };
  };
}
