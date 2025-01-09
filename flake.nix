{
  description = "My Nix modules.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?rev=8f3e1f807051e32d8c95cd12b9b421623850a34d";
    nur.url = "github:nix-community/NUR?rev=6d40a1f2e2fe9e912497232558012e72ff862897";
    systems.url = "github:nix-systems/default?rev=da67096a3b9bf56a91d16901293e51ba5b49a27e";

    base16 = {
      url = "github:SenchoPens/base16.nix?rev=c89c8123310257f3ddc04cc59aa4b5573c6d515f";
      inputs.fromYaml.follows = "fromYaml";
    };

    darwin = {
      url = "github:LnL7/nix-darwin?rev=57733bd1dc81900e13438e5b4439239f1b29db0e";
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

    fromYaml = {
      url = "github:SenchoPens/fromYaml?rev=106af9e2f715e2d828df706c386a685698f3223b";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager?rev=d4aebb947a301b8da8654a804979a738c5c5da50";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt = {
      url = "github:numtide/treefmt-nix?rev=3a92dc5faaec365df9070d975775b8b7c68d0d0d";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions?rev=2a84ca07753e3ec608c96ed2907606361979467a";
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
    {
      nixpkgs,
      treefmt,
      zig,
      ...
    }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
      treefmtEval = forAllSystems (
        system: treefmt.lib.evalModule nixpkgs.legacyPackages.${system} ./treefmt.nix
      );
    in
    {
      darwinModules.default = import ./systems/darwin;
      formatter = forAllSystems (system: treefmtEval.${system}.config.build.wrapper);
      nixosModules.default = import ./systems/linux;
      overlays.default = zig.overlays.default;
    };
}
