{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Twitch chat in the terminal
    twitch-tui
  ];
}
