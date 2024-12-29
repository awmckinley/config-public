{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # interactive jq
    ijq
  ];
}
