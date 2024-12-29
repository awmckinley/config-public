{
  isDarwin,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
      # language server for emmet.io
      # replaces: emmet-ls
      emmet-language-server
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      # HTML language server and templating language library
      superhtml-bin
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      # HTML language server and templating language library
      superhtml

      # HTML/CSS/JSON/ESLint language servers
      vscode-langservers-extracted
    ];

  nixpkgs.overlays = [
    (final: prev: {
      superhtml-bin = final.callPackage ../packages/superhtml-bin.nix { };
    })
  ];
}
// lib.optionalAttrs isDarwin {
  homebrew.brews = [
    # HTML/CSS/JSON/ESLint language servers
    "vscode-langservers-extracted"
  ];
}
