{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # package manager for OCaml
    opam
  ];
}
