{
  description = "My macOS and NixOS system flake.";

  inputs = {
    base16 = {
      url = "github:SenchoPens/base16.nix?rev=c89c8123310257f3ddc04cc59aa4b5573c6d515f";
      inputs.fromYaml.follows = "fromYaml";
    };

    darwin = {
      url = "github:LnL7/nix-darwin?rev=57733bd1dc81900e13438e5b4439239f1b29db0e";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1.165";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-compat = {
      url = "https://flakehub.com/f/edolstra/flake-compat/1.0.1";
      flake = false;
    };

    flake-utils = {
      url = "https://flakehub.com/f/numtide/flake-utils/0.1.102";
      inputs.systems.follows = "systems";
    };

    fromYaml = {
      url = "github:SenchoPens/fromYaml?rev=106af9e2f715e2d828df706c386a685698f3223b";
      flake = false;
    };

    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/0.2411.3879";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL?rev=63c3b4ed1712a3a0621002cd59bfdc80875ecbb0";
      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2411.712512";
    nur.url = "github:nix-community/NUR?rev=6d40a1f2e2fe9e912497232558012e72ff862897";
    systems.url = "github:nix-systems/default?rev=da67096a3b9bf56a91d16901293e51ba5b49a27e";

    treefmt = {
      url = "github:numtide/treefmt-nix?rev=3a92dc5faaec365df9070d975775b8b7c68d0d0d";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions?rev=2a84ca07753e3ec608c96ed2907606361979467a";
      inputs = {
        flake-compat.follows = "flake-compat";
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };

    zig = {
      url = "github:mitchellh/zig-overlay?rev=efff314a4daabec1de625a1780e774fdaea50605";
      inputs = {
        flake-compat.follows = "flake-compat";
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs =
    inputs@{
      base16,
      darwin,
      determinate,
      home-manager,
      nixos-wsl,
      nixpkgs,
      treefmt,
      ...
    }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
      treefmtEval = forAllSystems (
        system: treefmt.lib.evalModule nixpkgs.legacyPackages.${system} ./treefmt.nix
      );
    in
    {
      formatter = forAllSystems (system: treefmtEval.${system}.config.build.wrapper);

      # run: nix-darwin switch --flake "$(pwd)"
      darwinConfigurations = {
        krypton = darwin.lib.darwinSystem {
          modules = [
            ./hosts/krypton
          ];
          specialArgs = {
            inherit inputs;
            desktop = "aerospace";
            isDarwin = true;
            isLinux = false;
            remoteDesktop = false;
          };
        };
      };

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos
          ];
          specialArgs = {
            inherit inputs;
            isDarwin = false;
            isLinux = true;
          };
        };
      };
    };
}
