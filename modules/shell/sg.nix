{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # fast and polyglot tool for code searching, linting, rewriting at large scale
    ast-grep
  ];
}
