{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # object-oriented language for quick and easy programming
    (ruby_3_3.withPackages (
      ps: with ps; [
        # format ERB tools with speed and precision
        erb-formatter

        # Ruby static code analyzer and formatter
        rubocop

        # opinionated language server for Ruby
        ruby-lsp
      ]
    ))
  ];
}
