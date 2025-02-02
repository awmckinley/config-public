_: {
  disko.devices.disk.sdd = {
    type = "disk";
    device = "/dev/sdd";
    content = {
      type = "gpt";
      partitions = {
        luks = {
          size = "100%";
          content = {
            type = "luks";
            name = "crypted";
            settings.allowDiscards = true;
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/crypted";
            };
          };
        };
      };
    };
  };
}
