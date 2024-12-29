{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # modern replacement for ps
    procs
  ];
}
