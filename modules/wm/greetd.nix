{
  config,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isLinux {
  services.greetd = {
    # minimal and flexible login manager daemon
    enable = true;

    # greetd configuration
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --debug /tmp/tuigreet.log \
            --greeting '${config.networking.hostName}' \
            --time \
            --user-menu \
            --asterisks
        '';
      };
    };

    # virtual console
    vt = 1;
  };
}
