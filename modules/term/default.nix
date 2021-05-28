{ config, lib, pkgs, ... }:

{
  imports = [ ./kitty.nix ./alacritty.nix ./oh-my-tmux.nix ];
}
