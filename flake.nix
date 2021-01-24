{
  description = "Zebra Darwin System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs-stable-darwin.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";
    nixos-stable.url = "github:nixos/nixpkgs/nixos-20.09";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # flake-utils.url = "github:numtide/flake-utils";
};

  outputs = input @ { self, darwin, nixpkgs, home-manager, ... }: {
    darwinConfigurations = {
      zebra = darwin.lib.darwinSystem {
        modules = [ ./modules/hosts/zebra/configuration.nix ];
        inputs = { inherit darwin nixpkgs home-manager; };
      };
    };
  };
}