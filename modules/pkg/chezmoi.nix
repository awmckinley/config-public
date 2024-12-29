{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # manage your dotfiles across multiple machines, securely
    chezmoi
  ];
}
