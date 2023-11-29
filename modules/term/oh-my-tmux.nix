{ config, lib, pkgs, ... }:

let
  oh-my-tmux-conf-file = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf";
    name = "dot-tmux";
    # date = 2021-05-16T17:47:44-0500;
    sha256 = "1xmdxqmn4z9qshcn40r339hs72k5k5cic8mf267n0iyl5nny1fj4";
  };
in {
  programs.tmux = {
    enable = true;

    # NOTE this solves the issue with tmux running on Mac OS
    #  https://github.com/nix-community/home-manager/issues/1270
    secureSocket = false;

    extraConfig = builtins.readFile "${oh-my-tmux-conf-file}";

    tmuxinator.enable = true;

    # plugins = with pkgs; [
    #   tmuxPlugins.cpu
    #   {
    #     plugin = tmuxPlugins.resurrect;
    #     extraConfig = "set -g @resurrect-strategy-nvim 'session'";
    #   }
    #   {
    #     plugin = tmuxPlugins.continuum;
    #     extraConfig = ''
    #       set -g @continuum-restore 'on'
    #       set -g @continuum-save-interval '60' # minutes
    #     '';
    #   }
    # ];
  };
  # copy oh my tmux local configurations
  home.file.".tmux.conf.local".text = builtins.readFile ./tmux.conf.local;
  home.file.".tmux.conf".text = builtins.readFile "${oh-my-tmux-conf-file}";
}
