{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";


    # Devenv
    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
    #fenix.url = "github:nix-community/fenix";
    #fenix.inputs.nixpkgs.follows = "devenv/nixpkgs";
  };


  outputs = inputs@{ ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./dev/flake-module.nix
      ];
      systems = import inputs.systems;
    };
}
