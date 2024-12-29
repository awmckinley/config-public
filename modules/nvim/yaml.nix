{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # language server for YAML files
    yaml-language-server

    # Python YAML formatter that keeps your comments
    yamlfix
  ];
}
