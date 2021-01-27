{
  description = "Ashkan's Nix Machines";

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

  outputs = inputs @ { self, darwin, nixpkgs, home-manager, ... }: 
   let 
    nixpkgsConfig = with inputs; {
      config = {
         allowUnfree = true;
         allowBroken = false;
         allowUnsupportedSystem = false;
         permittedInsecurePackages = ["spidermonkey-38.8.0"];
      };
    };
    commonConfiguration = { pkgs, ... }: {
      nix = {
        package = pkgs.nixFlakes;
        extraOptions = "experimental-features = nix-command flakes";
        binaryCaches = [
          "https://cache.nixos.org/"
          # "https://hardselius.cachix.org"
        ];
        binaryCachePublicKeys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          # "hardselius.cachix.org-1:wdmClEq/2j8gEKJ5vLLCmpgCDumsyPMO6iVWKkYHKP0="
        ];
      };
      services.nix-daemon.enable = true;
    };
    darwinModules = {user, host}: with inputs; [
      (./. + "/modules/hosts/${host}/configuration.nix")
      commonConfiguration
      home-manager.darwinModules.home-manager
        {
          nixpkgs = nixpkgsConfig;
          # nix.nixPath = {
          #   nixpkgs = "$HOME/.config/nixpkgs/nixpkgs.nix";
          # };
          users.users.${user}.home = "/Users/${user}";
          home-manager = {
            useGlobalPkgs = true;
            users.${user} = with self.homeManagerModules; {
              imports = [(./. + "/modules/hosts/${host}/home.nix")];
            };
          };
        }
    ];
  in
  {
    darwinConfigurations = {
      # the host names should match exactly to the system $HOST
      # TODO make this functionality more robust -- change $HOST if needed
      zebra.lan = darwin.lib.darwinSystem {
        modules = darwinModules { user = "ashkanaleali"; host = "zebra"; };
        # inputs = { inherit darwin nixpkgs home-manager; };
      };
    };
  };

}

