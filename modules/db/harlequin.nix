{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # SQL IDE for your terminal
    harlequin
  ];
}
