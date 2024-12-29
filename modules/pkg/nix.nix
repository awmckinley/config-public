{ isLinux, pkgs, ... }:
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
      options = "--delete-older-than 30d";
    };

    settings = {
      # optimize by hard linking
      auto-optimise-store = isLinux;

      # enable flakes and nix-command
      experimental-features = [
        "flakes"
        "nix-command"
      ];

      # use Cachix
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];

      # use Cachix
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
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
      (import ../../overlays)
    ];
  };
}
