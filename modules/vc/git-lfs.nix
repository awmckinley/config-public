{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Git extension for versioning large files
    git-lfs
  ];
}
