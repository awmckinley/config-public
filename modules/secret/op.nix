{
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.casks = [
    # multi-platform password manager
    # replaces: Bitwarden, gopass, KeePass, LastPass, pass
    "1password"

    # 1Password command-line tool
    "1password-cli"
  ];
}
// lib.optionalAttrs isLinux {
  # 1Password command-line tool
  programs._1password.enable = true;

  # multi-platform password manager
  # replaces: Bitwarden, gopass, KeePass, LastPass, pass
  programs._1password-gui.enable = true;
}
