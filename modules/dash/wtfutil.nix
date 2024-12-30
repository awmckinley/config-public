{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # personal information dashboard for your terminal
    wtf
  ];
}
