{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # intuitive find & replace CLI (sed alternative)
    # replaces: sad, serpl
    sd
  ];
}
