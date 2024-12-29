{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "superhtml";
  version = "0.5.3";

  src = pkgs.fetchurl {
    url = "https://github.com/kristoff-it/superhtml/releases/download/v0.5.3/aarch64-macos.tar.gz";
    sha256 = "sha256-uLIyf2Zv8xZCIGEoThB63VxBPr39uRd0wMNwKmbmXsk=";
  };

  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;
  installPhase = ''
    mkdir -p $out/bin
    cp superhtml $out/bin/superhtml
  '';
}
