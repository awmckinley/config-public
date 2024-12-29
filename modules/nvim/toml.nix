{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # TOML toolkit written in Rust
    taplo
  ];
}
