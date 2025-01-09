{
  description = "My Nix modules.";

  inputs = {
    base16.url = "github:SenchoPens/base16.nix?rev=c89c8123310257f3ddc04cc59aa4b5573c6d515f";
    nixpkgs.url = "github:NixOS/nixpkgs?rev=ad3f60580aa2bbc095050867deb0e0335c2269f1";
    nur.url = "github:nix-community/NUR?rev=6d40a1f2e2fe9e912497232558012e72ff862897";
    systems.url = "github:nix-systems/default?rev=da67096a3b9bf56a91d16901293e51ba5b49a27e";

    darwin = {
      url = "github:LnL7/nix-darwin?rev=4b43b68281fd1a332c2aec8fbc077d92ca352c3e";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat?rev=0f9255e01c2351cc7d116c072cb317785dd33b33";
      flake = false;
    };

    flake-utils = {
      url = "github:numtide/flake-utils?rev=c1dfcf08411b08f6b8615f7d8971a2bfa81d5e8a";
      inputs.systems.follows = "systems";
    };

    home-manager = {
      url = "github:nix-community/home-manager?rev=509dbf8d45606b618e9ec3bbe4e936b7c5bc6c1e";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions?rev=6618c358b44a779a379485177d3391e9bd32fa09";
      inputs.flake-compat.follows = "flake-compat";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zig = {
      url = "github:mitchellh/zig-overlay?rev=efff314a4daabec1de625a1780e774fdaea50605";
      inputs.flake-compat.follows = "flake-compat";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, zig, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      darwinModules.default = import ./systems/darwin;
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
      nixosModules.default = import ./systems/linux;
      overlays.default = zig.overlays.default;
    };
}
