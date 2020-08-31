{ config, lib, pkgs, ... }:

{
  # activity monitoring
  programs.htop.enable = true;

  # send notifications
  programs.noti.enable = true;

  # a better ls
  programs.lsd = {
    enable = true;
    enableAliases = true;
  };
}
