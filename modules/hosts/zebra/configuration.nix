{ config, lib, pkgs, ... }:

let
  home_directory = "/Users/ashkanaleali";
  xdg_config_root = "${home_directory}/.config";
  tmp_directory = "/tmp";
in {

  imports = [
    # ../mac/yabai.nix
    # ../mac/skhd.nix

    # ../mac/emacs-daemon.nix
    # ../modules/db/mongodb.nix
  ];

  # NOTE macOS font support seems broken in home-manager so add them here
  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [

      # programming fonts
      jetbrains-mono
      fira-code
      fira-code-symbols

      # terminal fonts
      # TODO do I need all the fonts?
      nerdfonts
    ];
  };

  system.defaults = {
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

    # Firewall
    alf = {
      globalstate = 1;
      allowdownloadsignedenabled = 0;
      allowsignedenabled = 1;
      loggingenabled = 0;
      stealthenabled = 0;
    };

    screencapture = {
      location = "~/Desktop/Screenshot/";
      disable-shadow = true;
    };

    dock = {
      autohide = true;
      launchanim = true;
      orientation = "right";
    };

    finder = {
      CreateDesktop = false;
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      _FXShowPosixPathInTitle = true;
    };

    trackpad = {
      ActuationStrength = 1;
      Clicking = true;
      FirstClickThreshold = 2;
      SecondClickThreshold = 0;
      TrackpadThreeFingerDrag = false;
    };

    NSGlobalDomain = {
      # Disable press-and-hold for keys in favor of key repeat
      ApplePressAndHoldEnabled = false;

      # Enable subpixel font rendering on non-Apple LCDs
      # Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
      AppleFontSmoothing = 1;

      # Enable Dark mode
      AppleInterfaceStyle = "Dark";

      AppleShowScrollBars = "Automatic";

      NSDisableAutomaticTermination = false;

      NSDocumentSaveNewDocumentsToCloud = true;

      # Use medium Finder icons
      NSTableViewDefaultSizeMode = 2;

      NSTextShowsControlCharacters = false;

      # Enable spring loading the directories
      "com.apple.springing.enabled" = true;
      "com.apple.springing.delay" = "0.0";

      # Enable tap to click on the trackpad
      "com.apple.mouse.tapBehavior" = 1;

      NSUseAnimatedFocusRing = true;

      # auto hide the menue bar by default
      _HIHideMenuBar = true;

      NSScrollAnimationEnabled = true;

      # Enable full keyboard access for all controls
      # (e.g. enable Tab in modal dialogs)
      AppleKeyboardUIMode = 3;

      # Set a blazingly fast keyboard repeat rate
      InitialKeyRepeat = 10;
      KeyRepeat = 1;

      # Disable all these since they are annoying when writing code
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;

      # Increase window resize speed for Cocoa applications
      NSWindowResizeTime = "0.001";

      # Expand the print dialog by default
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;

      # Expand the save dialog by default
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;

    };

  };

  # TODO networking
  # networking = {
  #   dns = [ "127.0.0.1" ];
  #   search = [ "local" ];
  #   knownNetworkServices = [ "Ethernet" "Wi-Fi" ];
  # };

  # TODO
  # launchd.deamons = ...

  environment = {
    variables = import ../../env/vars.nix;

    systemPackages = with pkgs; [
      emacsMacport

      # pkg-config
      # libffi
      # imagemagick
      # stdenv
      # autoconf
      # gnumake
      # automake
      # libpng
      # pngpp
      # zlib.dev
      # poppler_gi
    ];

    # FIXME this doesn't work
    # NOTE as a workaround, use `chsh` and point to
    # NOTE /Users/USER_NAME/.nix-profile/bin/fish
    #
    # loginShell = "${home_directory}/.nix-profile/bin/fish";
    # loginShell = pkgs.fish;

    # shells = with pkgs; [
    #   # this is the fish installed by nix darwin
    #   fish
    #   # this is the fish installed by home manager
    #   "${home_directory}/.nix-profile/bin/fish"
    #   # this is the bash installed by home manager
    #   "${home_directory}/.nix-profile/bin/bash"
    # ];

    # Use a custom configuration.nix location.
    # NOTE still, initiall need to do the following
    # darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin-configuration.nix
    # TODO write a bootstrap script that takes care of this step
    # darwinConfig = "${xdg_config_root}/nixpkgs/darwin-configuration.nix";
    darwinConfig="$HOME/.config/nixpkgs/darwin-configuration.nix";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Enable Lorri, a nix-shell replacement that integrates with direnv
  services.lorri.enable = true;

  # programs.fish.enable = true;
  programs.bash.enable = true;
  programs.zsh.enable = true;

  # FIXME the nixpkgs configuration is duplicated in home.nix as well
  # nixpkgs = {
  #   config = {
  #     allowUnfree = true;
  #     allowBroken = false;
  #     allowUnsupportedSystem = true;
  #   };

    # TODO overlays? Do I need them?
    # overlays =
    #   let path = ../overlays; in with builtins;
    #   map (n: import (path + ("/" + n)))
    #       (filter (n: match ".*\\.nix" n != null ||
    #                   pathExists (path + ("/" + n + "/default.nix")))
    #               (attrNames (readDir path)))
    #     ++ [ (import ./envs.nix) ];
  # };

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix = {
    maxJobs = 8;
    buildCores = 0;
    # nixPath = [ "darwin-config=$HOME/.config/nixpkgs/darwin-configuration.nix" "/nix/var/nix/profiles/per-user/root/channels" "$HOME/.nix-defexpr/channels" ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # TODO test the following module.
  # TODO it may be very dangerous.
  # environment.etc = {
  #   sudo.text = ""
  #     "\n      # sudo: auth account password session\n      auth       sufficient     pam_tid.so\n      auth       sufficient     pam_smartcard.so\n      auth       required       pam_opendirectory.so\n      account    required       pam_permit.so\n      password   required       pam_deny.so\n      session    required       pam_permit.so\n    "
  #     "";
  # };
}
