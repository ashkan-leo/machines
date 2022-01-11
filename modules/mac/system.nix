{ config, lib, pkgs, ... }:

{
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
      _HIHideMenuBar = false;

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
}
