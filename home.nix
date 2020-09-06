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
  ###
  ### Environment Variables
  ###
  # FIXME not working
  # NOTE Manually doing this in fish shell config for now
  # home.sessionVariables = { EDITOR = "gac"; };

  home.packages = import ./packages/x86_64-darwin.nix { inherit pkgs; };

  # programs.tmux.enable = true;

}
