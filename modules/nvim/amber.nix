{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # programming language compiled to Bash
    amber-lang
  ];
}
