{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # simple, secure and modern encryption tool
    # replaces: age
    rage
  ];
}
