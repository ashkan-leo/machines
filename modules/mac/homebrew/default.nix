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
    "font-fira-mono-for-powerline"
    "font-fira-sans"
    "font-fira-sans-condensed"
    "font-fira-sans-extra-condensed"
    "font-firago"

    # iosevka family
    "font-iosevka"
    "font-iosevka-curly-slab"
    "font-iosevka-slab"
    "font-iosevka-ss02"
    "font-iosevka-ss05"
    "font-iosevka-ss08"
    "font-iosevka-ss11"
    "font-iosevka-ss14"
    "font-iosevka-ss17"
    "font-iosevka-aile"
    "font-iosevka-etoile"
    "font-iosevka-ss03"
    "font-iosevka-ss06"
    "font-iosevka-ss09"
    "font-iosevka-ss12"
    "font-iosevka-ss15"
    "font-iosevka-curly"
    "font-iosevka-ss01"
    "font-iosevka-ss04"
    "font-iosevka-ss07"
    "font-iosevka-ss10"
    "font-iosevka-ss13"
    "font-iosevka-ss16"

    # jetbrain family
    # "font-jetbrains-mono" the jetbrains mono nerd fonts installs this as well
    "jetbrains-space"
    "jetbrains-toolbox"
  ];
in {
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

    casks = [ "darktable" ] ++ nerdFonts ++ programmerFonts;
    brews = [ "pkg-config" "gpg-suite" ];
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
