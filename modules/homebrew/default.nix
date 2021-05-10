{ config, lib, pkgs, ... }:
with lib; {
  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "none"; # TODO change to zap
    taps = [
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/core"
      "homebrew/services"
      "d12frosted/emacs-plus"
    ];
    # FIXME App store apps gives an error.
    masApps = {
      # "1Password" = 1107421413;
      # "WireGuard" = 1451685025;
    };
    casks = [ "gpg-suite" "font-iosevka" ];
    # brews = [
    #   # "emacs-plus@28"
    #   ''''
    # ];
    # brew "emacs-plus@28", args:["with-ctags", "with-debug", "with-xwidgets", "with-native-comp", "with-dbus", "with-mailutils", "with-emacsicon4-icon"]
    extraConfig = ''
      brew "emacs-mac", args:["--with-rsvg", "--with-no-title-bars", "--with-emacs-big-sur-icon", "--with-mac-metal"]
    '';
  };
}
