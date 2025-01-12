{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # friendly and expressive command shell
    elvish
  ];
}
