{
  inputs,
  isLinux,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # explain why two Nix derivations differ
    nix-diff

    # CLI for searching packages on search.nixos.org
    nix-search-cli
  ];

  nix = {
    # use garbage collection
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };

    settings = {
      # optimize by hard linking
      auto-optimise-store = isLinux;

      # enable flakes and nix-command
      experimental-features = [
        "flakes"
        "nix-command"
      ];

      # disable warnings that Git is dirty
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config = {
      # allow unfree packages
      allowUnfree = true;

      # accept input fonts license
      input-fonts.acceptLicense = true;
    };

    # apply each overlay found in overlays directory
    overlays = [
      inputs.zig.overlays.default
      (import ../../overlays)
    ];
  };
}
