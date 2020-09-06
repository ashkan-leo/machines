{ config, lib, pkgs, ... }:

let
  oh-my-tmux-conf-file = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf";
    sha256 = "0qsz8g6x7ywg0m9mvz183m3wy9q7b0g99njb6vsd69yz7bj9z73n";
    name = "dot-tmux";
  };
in {
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile "${oh-my-tmux-conf-file}";
  };

  home.file.".tmux.conf.local".text = builtins.readFile ./tmux.conf.local;
}
