{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # grammar checker for developers
    # replaces: languagetool
    harper

    # source code spell checker
    typos
  ];
}
