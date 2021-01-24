{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/shell/fish.nix
    ./modules/shell/broot.nix
    ./modules/shell/direnv.nix
    ./modules/shell/misc.nix

    ./modules/term/kitty.nix
    ./modules/term/alacritty.nix
    ./modules/term/oh-my-tmux.nix
    # ./modules/term/pet.nix

    # TODO implement spark
    # ./modules/tools/sparkling.nix

    # FIXME emacs causes yabai become unresponsive
    # FIXME for now use the homebrew installation
    # TODO fix the nix emacs installation and achieve nirvana
    # ./modules/editor/emacs.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ashkanaleali";
  home.homeDirectory = "/Users/ashkanaleali";
  home.sessionVariables = import ./modules/env/vars.nix;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = import ./packages/x86_64-darwin.nix { inherit pkgs; };

  # FIXME the nixpkgs configuration is duplicated in darwin/configuration.nix as well
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      allowUnsupportedSystem = true;
      permittedInsecurePackages = [ "spidermonkey-38.8.0" ];

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
}
