{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # create beautiful images of your source code
    # replaces: Freeze
    silicon
  ];
}
