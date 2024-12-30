{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # syntax-highlighting pager for Git
    # replaces: diff-so-fancy and git-split-diffs
    delta

    # delta dependencies
    bat
  ];
}
