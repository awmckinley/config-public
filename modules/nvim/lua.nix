{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # language server that offers Lua language support
    lua-language-server

    # static analyzer and a linter for Lua
    lua51Packages.luacheck

    # opinionated Lua code formatter
    stylua
  ];
}
