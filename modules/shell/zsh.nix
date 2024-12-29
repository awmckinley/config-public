{
  isLinux,
  lib,
  pkgs,
  ...
}:
{
  # the Z shell
  programs.zsh.enable = true;

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
