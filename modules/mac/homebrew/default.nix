{ config, lib, pkgs, ... }:

with lib;
let
  nerdFonts = [
    "font-3270-nerd-font"
    "font-caskaydia-cove-nerd-font"
    "font-fira-mono-nerd-font"
    "font-inconsolata-go-nerd-font"
    "font-monofur-nerd-font"
    "font-proggy-clean-tt-nerd-font"
    "font-ubuntu-nerd-font"
    "font-agave-nerd-font"
    "font-code-new-roman-nerd-font"
    "font-go-mono-nerd-font"
    "font-inconsolata-lgc-nerd-font"
    "font-monoid-nerd-font"
    "font-roboto-mono-nerd-font"
    "font-victor-mono-nerd-font"
    "font-anonymice-nerd-font"
    "font-cousine-nerd-font"
    "font-gohufont-nerd-font"
    "font-inconsolata-nerd-font"
    "font-mononoki-nerd-font"
    "font-sauce-code-pro-nerd-font"
    "font-arimo-nerd-font"
    "font-daddy-time-mono-nerd-font"
    "font-hack-nerd-font"
    "font-iosevka-nerd-font"
    "font-mplus-nerd-font"
    "font-shure-tech-mono-nerd-font"
    "font-aurulent-sans-mono-nerd-font"
    "font-dejavu-sans-mono-nerd-font"
    "font-hasklug-nerd-font"
    "font-jetbrains-mono-nerd-font"
    "font-noto-nerd-font"
    "font-space-mono-nerd-font"
    "font-bigblue-terminal-nerd-font"
    "font-droid-sans-mono-nerd-font"
    "font-heavy-data-nerd-font"
    "font-lekton-nerd-font"
    "font-open-dyslexic-nerd-font"
    "font-terminess-ttf-nerd-font"
    "font-bitstream-vera-sans-mono-nerd-font"
    "font-fantasque-sans-mono-nerd-font"
    "font-hurmit-nerd-font"
    "font-liberation-nerd-font"
    "font-overpass-nerd-font"
    "font-tinos-nerd-font"
    "font-blex-mono-nerd-font"
    "font-fira-code-nerd-font"
    "font-im-writing-nerd-font"
    "font-meslo-lg-nerd-font"
    "font-profont-nerd-font"
    "font-ubuntu-mono-nerd-font"
  ];
  programmerFonts = [

    # fira-code family
    "font-fira-mono"
    "font-firago"
    "font-fira-sans"

    # iosevka family
    "font-iosevka"

    # jetbrain family
    "jetbrains-space"
    "jetbrains-toolbox"
  ];
  etcFonts = [
    "font-roboto-slab"
    "font-lato"
  ];
  fonts = nerdFonts ++ programmerFonts ++ etcFonts;
in {
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "none";
    autoUpdate = true;
    };

    taps = [
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/core"
      "homebrew/services"
      "d12frosted/emacs-plus"
      "railwaycat/emacsmacport"
    ];

    # install apps from Mac App Store
    masApps = {
      # "1Password" = 1333542190;
      "HazeOver" = 430798174;
      "Pocket" = 568494494;
      "Tailscale" = 1475387142;
      "Drafts" = 1435957248;
      "WireGuard" = 1451685025;
      "GoodNotes 5" = 1444383602;
      "Things 3" = 904280696;
      "Rouzshomar" = 476295182;
      "HP Smart for Desktop" = 1474276998;
      "Slack for Desktop" = 803453959;
      "Sleep Control Centre" = 946798523;
      # "Spike Email" = 707452888; # FIXME this gets installed every fukcing time I switch
    };

    casks = [ "discord" "darktable" "firefox-beta" "amethyst" "dropbox" ]
      ++ fonts;
    brews = [ "pkg-config" "svn" "openssl@1.1" ];

    # brew "emacs-plus@28", args:["with-ctags", "with-debug", "with-xwidgets", "with-native-comp", "with-dbus", "with-mailutils", "with-emacsicon4-icon"]
    extraConfig = ''
      brew "emacs-mac", args:["with-no-title-bars", "with-mac-metal", "with-starter", "with-ctags", "with-native-compilation", "with-imagemagick", "with-native-compilation"]
      brew "koekeishiya/formulae/yabai"
    '';
  };
}
