{ lib, pkgs, ... }:
{
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

      # telescope-fzf-native dependencies
      clang

      # treesitter dependencies
      curl
      gnutar
      nodejs_20
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
