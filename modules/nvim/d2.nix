{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # modern diagram scripting language that turns text to diagrams
    d2
  ];
}
