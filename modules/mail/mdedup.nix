{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # deduplicate mails from mail boxes
    python312Packages.mail-deduplicate
  ];
}
