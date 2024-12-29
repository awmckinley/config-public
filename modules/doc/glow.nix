{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # render Markdown on the CLI
    glow
  ];
}
