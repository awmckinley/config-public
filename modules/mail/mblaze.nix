{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # process and interact with mail messages
    # replaces: himalaya, mailx, mh/nmh, mother, neatmail, nedmail
    mblaze

    # dependencies
    libxml2
  ];
}
