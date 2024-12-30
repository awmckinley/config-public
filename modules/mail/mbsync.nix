{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # free IMAP and MailDir mailbox synchronizer
    # replaces: fdm, fetchmail, getmail, offlineimap
    isync
  ];
}
