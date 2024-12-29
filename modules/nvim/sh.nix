{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # language server for Bash
    bash-language-server

    # shell script analysis tool
    shellcheck

    # corrective Bash syntax highlighter
    shellharden

    # shell parser and formatter
    # replaces: beautysh
    shfmt
  ];
}
