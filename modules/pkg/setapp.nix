{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  options.setapp = with lib; {
    apps = mkOption {
      type = types.attrsOf types.ints.positive;
      default = { };
      description = "Apps to install with Setapp.";
    };
  };

  config = {
    homebrew.casks = [
      # collection of apps available by subscription
      "setapp"
    ];

    # add reminders for missing Setapp apps
    system.activationScripts.setapp.text = ''
      function task-setapp() {
        if ! test -d "/Applications/Setapp/$2.app"; then
          ${pkgs.taskwarrior3}/bin/task rc.context= rc.hooks=0 add "install $2 with Setapp" +next "+$(hostname)"
          ${pkgs.taskwarrior3}/bin/task rc.context= rc.hooks=0 +LATEST annotate -- "setapp://launch/$1"
        fi
      }

      ${lib.concatStringsSep "\n" (
        lib.mapAttrsToList (name: id: ''task-setapp ${toString id} "${name}"'') config.setapp.apps
      )}
    '';
  };
}
