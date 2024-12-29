{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # integrated language service for Typst
    # replaces: typst-lsp
    tinymist

    # new markup-based typesetting system that is powerful and easy to learn
    typst

    # format your Typst source code
    typstyle
  ];
}
