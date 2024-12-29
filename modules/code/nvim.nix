{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # avante.nvim
    cargo

    # lazy.nvim dependencies
    gnumake

    # telescope-fzf-native.nvim dependencies
    clang # replaces: gcc

    # nvim-treesitter dependencies
    curl
    gnutar
    nodejs_20
    tree-sitter
  ];
}
