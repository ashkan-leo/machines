{ config, lib, pkgs, ... }:

let
  oh-my-tmux-conf-file = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf";
    sha256 ="1qczy6xz62ls2364473js6nh4cisx1jzf3f8mi5xr8h38a4qwmaq";
    name = "dot-tmux";
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
}
