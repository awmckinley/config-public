{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # shell tool for executing jobs in parallel
    parallel
  ];
}
