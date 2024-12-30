{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # mail indexer
    # replaces: mu
    notmuch
  ];
}
