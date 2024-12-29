{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # professional PHP tooling for any Language Server Protocol capable editor
    intelephense

    # HTML-embedded scripting language
    php82

    # tool to automatically fix PHP coding standards issues
    php82Packages.php-cs-fixer
  ];
}
