{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tool for monitoring the progress of data through a pipeline
    # replaces: cat
    pv
  ];
}
