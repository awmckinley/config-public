{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # secure, cross-platform Git credential storage
    git-credential-manager
  ];
}
