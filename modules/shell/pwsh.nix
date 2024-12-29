{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # powerful cross-platform shell and scripting language based on .NET
    powershell
  ];
}
