{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tool to create committing rules for projects, auto bump versions, and generate changelogs
    # replaces: cocogitto, convco, cz-cli
    commitizen
  ];
}
