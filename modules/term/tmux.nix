{ config, lib, pkgs, ... }:

let
  omt = pkgs.fetchgit {
    url = "https://github.com/gpakosz/.tmux";
    rev = "HEAD";
    sha256 = "d6f0f647dd68561ed010f83d8d226383aebfb805";
  };
  conf-file = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf";
    sha256 = "987987987987";
  };
  # omf-config = "blah blah balh";
in {

  # programs.tmux = {
  #   enable = true;

  #   #   historyLimit = 10000;
  # };

  # home.file.".tmux.conf".text =
  # lib.mkDefault (lib.mkAfter (builtins.readFile conf-file));

  #   # extraConfig = builtins.readFile builtins.path {
  #   #   path = oh_my_tmux_conf_file;
  #   #   name = "balh";
  #   # };

  # keyMode = "vi";
  # newSession = true;
  # shortcut = "a";
  #   terminal = "alacritty";
  #   tmuxp.enable = true;
  #   tmuxinator.enable = true;

  #   # plugins = with pkgs; [
  #   #   tmuxPlugins.cpu
  #   #   {
  #   #     plugin = tmuxPlugins.resurrect;
  #   #     extraConfig = "set -g @resurrect-strategy-nvim 'session'";
  #   #   }
  #   #   {
  #   #     plugin = tmuxPlugins.continuum;
  #   #     extraConfig = ''
  #   #       set -g @continuum-restore 'on'
  #   #       set -g @continuum-save-interval '60' # minutes
  #   #     '';
  #   #   }
  #   # ];
  # };
}
