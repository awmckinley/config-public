{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # minimal, blazing fast, and extremely customizable prompt for any shell
    # replaces: oh-my-posh, powerlevel10k
    starship
  ];
}
