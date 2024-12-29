{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # fast cd that learns your habits
    # replaces: autojump, fasd, fastfile, jump, pj, scd,
    # replaces: wd, z.lua, z.sh, zsh-z, ZLocation
    zoxide
  ];
}
