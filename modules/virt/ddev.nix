{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Docker-based local PHP+Node.js web development environments
    ddev
  ];
}
