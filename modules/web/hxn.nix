{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # save screenshots of urls and webpages from terminal
    # NOTE: requires Chromium
    haylxon
  ];
}
