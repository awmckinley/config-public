{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # human-friendly and fast alternative to cut and (sometimes) awk
    choose
  ];
}
