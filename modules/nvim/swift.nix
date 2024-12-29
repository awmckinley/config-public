{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # formatting technology for Swift source code
    swift-format
  ];
}
