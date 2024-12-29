{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # simple LaTeX parser
    python312Packages.pylatexenc
  ];
}
