{
  lib,
  python3,
  runCommand,
}:
let
  python = python3;
  withPlugins =
    selector:
    runCommand "mdformat-wrapped"
      {
        inherit (python.pkgs.mdformat) pname version meta;

        nativeBuildInputs = [ python.pkgs.wrapPython ];

        plugins = selector python.pkgs;

        passthru = {
          inherit withPlugins;
        };
      }
      ''
        buildPythonPath "$plugins"
        makeWrapper ${lib.getExe python.pkgs.mdformat} $out/bin/mdformat \
          --suffix PYTHONPATH : "$program_PYTHONPATH"
      '';
in
withPlugins (ps: [ ])
