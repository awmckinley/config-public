{
  isLinux,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [ ]
    ++ lib.optionals isLinux [
      # deduplicate mails from mail boxes
      python312Packages.mail-deduplicate
    ];
}
