{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # debugger for the Go programming language
    delve

    # Go programming language
    go

    # stricter gofmt
    gofumpt

    # official language server for the Go language
    gopls

    # additional tools for Go Development
    (linkFarm "gotools" [
      {
        name = "bin/goimports";
        path = "${gotools}/bin/goimports";
      }
    ])
  ];
}
