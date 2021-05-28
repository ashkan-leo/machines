{ config, lib, pkgs, ... }:

{
  imports =
    [ ./skhd.nix ./yabai.nix ./system.nix ./programs.nix ./services.nix ];
}
