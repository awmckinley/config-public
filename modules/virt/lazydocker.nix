{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # simple terminal UI for both docker and docker-compose
    lazydocker
  ];
}
