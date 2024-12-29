{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # execute a program periodically
    # replaces: Viddy
    watch
  ];
}
