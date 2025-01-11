{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # markdown LSP server inspired by Obsidian
    # replaces: marksman, prosemd-lsp, remark-ls, zk
    markdown-oxide

    # CommonMark compliant Markdown formatter
    (mdformat.withPlugins (ps: [
      ps.mdformat-frontmatter
      ps.mdformat-gfm
      ps.mdformat-obsidian
      ps.mdformat-simple-breaks
      ps.mdformat-tables
      ps.mdformat-wikilink
    ]))
  ];
}
