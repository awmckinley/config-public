{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # executes commands in response to file modifications
    # replaces: entr, fswatch, guard, Hazel, jonsnow, modd, sniffer, watchdog, watchman
    watchexec
  ];
}
