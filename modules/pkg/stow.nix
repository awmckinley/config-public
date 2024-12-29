{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # install multiple software packages in the same run-time directory tree
    stow
  ];
}
