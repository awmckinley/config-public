{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # utility that combines the usability of The Silver Searcher with the raw speed of grep
    # replaces: ack, ag, agrep, grep, pt and ugrep
    ripgrep
  ];
}
