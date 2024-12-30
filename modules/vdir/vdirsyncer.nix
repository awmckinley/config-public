{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # synchronize calendars and contacts
    vdirsyncer
  ];
}
