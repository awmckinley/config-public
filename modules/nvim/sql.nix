{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # CLI tool for formatting SQL
    # replaces: sqlfluff
    sleek
  ];
}
