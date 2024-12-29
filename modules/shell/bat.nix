{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # cat clone with syntax highlighting and Git integration
    # replaces: cat
    bat
  ];
}
