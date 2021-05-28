{ config, lib, pkgs, ... }:

{
  services.nix-daemon.enable = true;
  services.lorri.enable = true;
}
