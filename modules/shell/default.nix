{ config, lib, pkgs, ... }:

{
  imports =
    [ ./fish.nix ./broot.nix ./direnv.nix ./misc.nix ./ssh.nix ./git.nix ];
  programs.bat = {
    enable = true;
    config = {
      theme = "Solarized (dark)";
      pager = "less -FR";
      map-syntax = [ "*.jenkinsfile:Groovy" "*.props:Java Properties" ];
    };
  };
}
