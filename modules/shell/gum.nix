{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tasty Bubble Gum for your shell
    gum
  ];
}
