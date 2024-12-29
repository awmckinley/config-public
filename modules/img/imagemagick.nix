{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # software suite to create, edit, compose, or convert bitmap images
    imagemagick
  ];
}
