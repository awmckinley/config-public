{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # your everyday IRC student
    # replaces: bitlbee, irssi, weechat
    senpai
  ];
}
