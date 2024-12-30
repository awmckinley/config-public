{ isLinux, lib, ... }:
{ }
// lib.optionalAttrs isLinux {
  services.openssh = {
    # implementation of the SSH protocol
    enable = true;

    settings = {
      # require key authentication
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;
    };
  };
}
