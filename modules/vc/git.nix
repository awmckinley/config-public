{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # distributed version control system
    git
  ];
}
