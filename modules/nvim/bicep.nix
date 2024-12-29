{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # DSL for deploying Azure resources declaratively
    bicep
  ];
}
