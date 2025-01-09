{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # linting for your git commit messages
    # replaces: commitlint, gitlint
    committed
  ];
}
