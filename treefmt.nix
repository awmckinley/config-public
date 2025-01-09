{ ... }:
{
  projectRootFile = "flake.nix";
  programs.nixfmt.enable = true;

  programs.shfmt = {
    enable = true;
    indent_size = null;
  };
}
