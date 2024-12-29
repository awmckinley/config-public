{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # most popular clone of the VI editor
    vim
  ];
}
