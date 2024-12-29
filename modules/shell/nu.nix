{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # modern shell written in Rust
    nushell
  ];
}
