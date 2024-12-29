{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tool for formatting Clojure code
    cljfmt

    # Language Server Protocol for Clojure
    clojure-lsp
  ];
}
