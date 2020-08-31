{ config, lib, pkgs, ... }:

let
  home_directory = "/Users/ashkanaleali";
  xdg_config_root = "${home_directory}/.config";
  tmp_directory = "/tmp";
  localconfig = import <localconfig>;
in {

  imports = [ ../modules/mac/yabai.nix ../modules/mac/skhd.nix ];

  # NOTE fonts support seems broken in home-manager
  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      # programming fonts
      jetbrains-mono
      fira-code
      fira-code-symbols

      # terminal fonts
      # TODO do I need all the fonts?
      nerdfonts

    ];
  };

  # TODO system.defaults stuff
  system.defaults = {
    dock = {
      autohide = true;
      launchanim = true;
      orientation = "right";
    };

    finder = {
      CreateDesktop = false;
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      _FXShowPosixPathInTitle = true;
    };

    trackpad = {
      ActuationStrength = 1;
      Clicking = true;
      FirstClickThreshold = 2;
      SecondClickThreshold = 0;
      TrackpadThreeFingerDrag = true;
    };

  };

  # TODO networking
  # networking = {
  #   dns = [ "127.0.0.1" ];
  #   search = [ "local" ];
  #   knownNetworkServices = [ "Ethernet" "Wi-Fi" ];
  # };

  # TODO
  # launchd.deamons = ...

  environment = {
    variables = import ../modules/env/vars.nix;
    loginShell = "$HOME/.nix-profile/bin/fish";

    # Use a custom configuration.nix location.
    # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
    darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  programs.fish.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      allowUnsupportedSystem = false;
    };

    # TODO overlays? Do I need them?
    # overlays =
    #   let path = ../overlays; in with builtins;
    #   map (n: import (path + ("/" + n)))
    #       (filter (n: match ".*\\.nix" n != null ||
    #                   pathExists (path + ("/" + n + "/default.nix")))
    #               (attrNames (readDir path)))
    #     ++ [ (import ./envs.nix) ];
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
