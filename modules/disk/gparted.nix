{
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # graphical disk partitioning tool
    gparted

    # gparted dependencies
    btrfs-progs
    cryptsetup
    dosfstools
    e2fsprogs
    exfatprogs
    f2fs-tools
    hfsprogs
    jfsutils
    lvm2
    mtools
    nilfs-utils
    ntfs3g
    reiser4progs
    reiserfsprogs
    udftools
    util-linux
    xfsdump
    xfsprogs
  ];
}
