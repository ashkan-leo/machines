{ config, lib, pkgs, ... }:

{
  imports =
    [ ./fish.nix ./broot.nix ./direnv.nix ./misc.nix ./ssh.nix ./git.nix ];
}
