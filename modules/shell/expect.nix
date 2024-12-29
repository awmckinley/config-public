{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tool for automating interactive applications
    expect
  ];
}
