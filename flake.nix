{
  description = "Ashkan's Nix Machines";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs-stable-darwin.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";
    nixos-stable.url = "github:nixos/nixpkgs/nixos-20.09";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, darwin, nixpkgs, home-manager, nixpkgs-master
    , nixpkgs-stable-darwin, nixos-stable, nixpkgs-unstable, nixos-hardware
    , flake-utils }:
    let
      # This is passed to the home-manager.
      # Common Configuration
      nixpkgsConfig = with inputs; {
        config = {
          allowUnfree = true;
          allowBroken = false;
          allowUnsupportedSystem = true;
          permittedInsecurePackages = [ "spidermonkey-38.8.0" ];
        };
      };
      # Common Configuration
      nixosCommonConfiguration = { pkgs, ... }: {
        nix = {
          package = pkgs.nixFlakes;
          extraOptions = "experimental-features = nix-command flakes";
          settings = {
            substituters = [ "https://cache.nixos.org/" ];
            trusted-public-keys = [
              "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            ];
          };
        };
      };
      # Darwin Common Configuration
      darwinCommonConfiguration = { pkgs, ... }: {
        nix = {
          package = pkgs.nixFlakes;
          extraOptions = "experimental-features = nix-command flakes";
          settings = {
            substituters = [ "https://cache.nixos.org/" ];
            trusted-public-keys = [
              "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            ];
          };
        };
        services.nix-daemon.enable = true;
      };
      # Produce a Darwin System configuration given the username and the hostname
      # Requires Admin Access to system
      darwinModules = { user, host }:
        with inputs; [
          (./. + "/modules/hosts/${host}/configuration.nix")
          darwinCommonConfiguration
          home-manager.darwinModules.home-manager
          {
            nixpkgs = nixpkgsConfig;
            nix.configureBuildUsers = true;
            users.users.${user}.home = "/Users/${user}";
            home-manager = {
              useGlobalPkgs = true;
              users.${user} = with self.homeManagerModules; {
                imports = [ (./. + "/modules/hosts/${host}/home.nix") ];
              };
            };
          }
        ];
      # Produce a common linux System configuration given the username and the hostname
      # FIXME Requires Admin Access to system
      linuxModules = { user, host }:
        with inputs; [
          (./. + "/modules/hosts/${host}/configuration.nix")
          # FIXME this hostname business is repeated all over the place
          # ({ pkgs, ... }: { networking.hostname = "nano"; })
          nixosCommonConfiguration
          home-manager.nixosModules.home-manager
          {
            nixpkgs = nixpkgsConfig;
            users.users.${user}.home = "/home/${user}";
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${user} = with self.homeManagerModules; {
                imports = [ (./. + "/modules/hosts/${host}/home.nix") ];
              };
            };
          }
        ];
    in {
      darwinConfigurations = {
        # the host names should match exactly to the system $HOST
        # TODO make this functionality more robust -- change $HOST if needed
        zebra.lan = darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          modules = darwinModules {
            user = "ashkanaleali";
            host = "zebra";
          };
        };
        dolphin = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = darwinModules {
            user = "ashkan";
            host = "dolphin";
          };
        };
        chi-aaleali-mac = darwin.lib.darwinSystem {
          modules = darwinModules {
            user = "aaleali";
            host = "chi-aaleali-mac";
          };
        };


        ashkaan-mbp = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = darwinModules { 
            user = "ashkaan";
            host = "ashkaan-mbp"; 
          };
        };
      };


      nixosConfigurations = {
        titan = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = linuxModules {
            user = "ashkan";
            host = "titan";
          };
        };
      };
    };
}
