{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # email client for your terminal
    # replaces: alot, bower, meli, mutt/neomutt, pine/alpine, sup
    aerc

    # dependencies
    chafa
    dante
    html2text
    pandoc
    w3m
  ];
}
