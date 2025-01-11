{
  isLinux,
  lib,
  pkgs,
  ...
}:
{
  # the Z shell
  programs.zsh.enable = true;

  # link zsh files
  environment.pathsToLink = [ "/share/zsh" ];

  # add zsh to system shells
  environment.shells = [ pkgs.zsh ];

  environment.systemPackages = with pkgs; [
    # fzf-tab and zsh-fzf-history-search
    fzf

    # zgenom
    git
  ];
}
// lib.optionalAttrs isLinux {
  # make zsh the default shell
  users.defaultUserShell = pkgs.zsh;
}
