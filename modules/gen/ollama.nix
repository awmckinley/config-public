{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # get up and running with large language models locally
    ollama
  ];
}
// lib.optionalAttrs isDarwin {
  launchd.user.agents.ollama = {
    path = [ config.environment.systemPath ];
    serviceConfig = {
      KeepAlive = true;
      ProcessType = "Interactive";
      ProgramArguments = [
        "${pkgs.ollama}/bin/ollama"
        "serve"
      ];
      StandardErrorPath = "/tmp/ollama.log";
      StandardOutPath = "/tmp/ollama.log";
    };
  };
}
