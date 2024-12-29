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
    # simple hotkey daemon for macOS
    skhd
  ];

  launchd.user.agents.skhd = {
    path = [ config.environment.systemPath ];
    serviceConfig = {
      KeepAlive = true;
      ProcessType = "Interactive";
      ProgramArguments = [ "${pkgs.skhd}/bin/skhd" ];
      StandardErrorPath = "/tmp/skhd.log";
      StandardOutPath = "/tmp/skhd.log";
    };
  };
}
