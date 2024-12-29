{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # incoming webhook server that executes shell commands
    webhook
  ];
}
