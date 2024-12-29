{ lib, pkgs, ... }:
{
  imports = [
    ./amber.nix
    ./bicep.nix
    ./clojure.nix
    ./cs.nix
    ./d2.nix
    ./elixir.nix
    ./english.nix
    ./go.nix
    ./html.nix
    ./java.nix
    ./javascript.nix
    ./jelly.nix
    ./kotlin.nix
    ./lua.nix
    ./make.nix
    ./markdown.nix
    ./nix.nix
    ./ocaml.nix
    ./php.nix
    ./plaintex.nix
    ./python.nix
    ./ruby.nix
    ./rust.nix
    ./sh.nix
    ./sql.nix
    ./swift.nix
    ./toml.nix
    ./typst.nix
    ./xml.nix
    ./yaml.nix
    ./zig.nix
  ];

  environment.systemPackages =
    with pkgs;
    [
      # Vim text editor fork focused on extensibility and agility
      neovim

      # nvim dependencies
      ripgrep

      # lazy dependencies
      git
      gnumake
      lua51Packages.lua
      lua51Packages.luarocks

      # telescope dependencies
      fd

      # treesitter dependencies
      tree-sitter
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      # img-clip dependencies
      pngpaste
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      # clipboard dependencies
      xsel

      # img-clip dependencies
      xclip
    ];
}
