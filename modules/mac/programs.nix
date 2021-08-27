{ config, lib, pkgs, ... }:

{
  # the dotfiles are handled in home-manager
  # enable the programs so we are able to do chsh later on
  programs.fish.enable = true;
  programs.bash.enable = true;
  programs.zsh.enable = true;
}
