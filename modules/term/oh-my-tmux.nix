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

  # oh my tmux local configurations
  # https://github.com/gpakosz/.tmux/blob/master/.tmux.conf.local
  # home.file.".tmux.conf.local".text = ''

  #   # -- windows & pane creation ---------------------------------------------------

  #   # new window retains current path, possible values are:
  #   #   - true
  #   #   - false (default)
  #   tmux_conf_new_window_retain_current_path=true

  #   # new pane retains current path, possible values are:
  #   #   - true (default)
  #   #   - false
  #   tmux_conf_new_pane_retain_current_path=true

  #   # new pane tries to reconnect ssh sessions (experimental), possible values are:
  #   #   - true
  #   #   - false (default)
  #   tmux_conf_new_pane_reconnect_ssh=false

  #   # prompt for session name when creating a new session, possible values are:
  #   #   - true
  #   #   - false (default)
  #   tmux_conf_new_session_prompt=false
  # '';
}
# let
#   omt = pkgs.fetchgit {
#     url = "https://github.com/gpakosz/.tmux";
#     rev = "HEAD";
#     sha256 = "d6f0f647dd68561ed010f83d8d226383aebfb805";
#   };
#   # conf-file = pkgs.fetchurl {
#   #   url = "https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf";
#   #   sha256 = "987987987987";
#   # };
#   # omf-config = "blah blah balh";
# in {

#   pkgs.runCommand "oh-my-tmux" {  } ''
#     mkdir -p $out/share
#     ln -s ${}
#   ''

# }

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
