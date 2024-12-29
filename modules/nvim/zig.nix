{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # general-purpose programming language and toolchain
    zigpkgs."0.13.0"
  ];
}
