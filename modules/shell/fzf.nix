{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # command-line fuzzy finder
    # replaces: fpp, heatseeker, luneta, peco, percol, pick, selecta, skim, zf
    fzf
  ];
}
