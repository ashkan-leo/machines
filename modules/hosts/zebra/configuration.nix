{ config, lib, pkgs, ... }:

let
  home_directory = "/Users/ashkanaleali";
  xdg_config_root = "${home_directory}/.config";
  tmp_directory = "/tmp";
in {
  imports = [ ../../mac ../../mac/homebrew ];
  environment = {
    variables = import ../../env/vars.nix;
    darwinConfig = "$HOME/.config/nixpkgs/darwin-configuration.nix";
  };

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix = {
    maxJobs = 8;
    buildCores = 0;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

}
