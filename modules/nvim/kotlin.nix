{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # reformats Kotlin source code
    ktfmt

    # Kotlin language server
    kotlin-language-server
  ];
}
