{ config, pkgs, lib, ... }:

{
  imports = [
    ../../shell/fish.nix
    ../../shell/broot.nix
    ../../shell/direnv.nix
    ../../shell/misc.nix

    ../../term/kitty.nix
    ../../term/alacritty.nix
    ../../term/oh-my-tmux.nix
    # ./modules/term/pet.nix

    # TODO implement spark
    # ./modules/tools/sparkling.nix

    # FIXME emacs causes yabai become unresponsive
    # FIXME for now use the homebrew installation
    # TODO fix the nix emacs installation and achieve nirvana
    # ./modules/editor/emacs.nix
  ];
  home.packages = import ../../packages/x86_64-darwin.nix { inherit pkgs; };

  # Configure git for this machine
  programs.git = {
    enable = true;
    userName = "ashkan-leo";
    userEmail = "ashkan.aleali@gmail.com";

    lfs.enable = true;
    delta = {
      enable = true;
      options = {
        features = "decorations";
        whitespace-error-style = "22 reverse";
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-style = "bold yellow ul";
          file-decoration-style = "none";
        };
      };
    };

    # TODO deofine some cool alias here
    aliases = { co = "checkout"; };

    attributes = [ "*.pdf diff=pdf" ];

    ignores = [
      ".direnv"
      ".envrc"
      "*~"
      "#*#"
      "/.emacs.desktop"
      "/.emacs.desktop.lock"
      "*.elc"
      "auto-save-list"
      "tramp"
      ".#*"
      ".org-id-locations"
      "*_archive"
      "*_flymake.*"
      "/eshell/history"
      "/eshell/lastdir"
      "/elpa/"
      "*.rel"
      "/auto/"
      ".cask/"
      "dist/"
      "flycheck_*.el"
      "/server/"
      ".projectile"
      ".dir-locals.el"
      "/network-security.data"
      ".bloop/"
      ".metals/"
      "project/metals.sbt"
      ".idea/**/workspace.xml"
      ".idea/**/tasks.xml"
      ".idea/**/usage.statistics.xml"
      ".idea/**/dictionaries"
      ".idea/**/shelf"
      ".idea/**/contentModel.xml"
      ".idea/**/dataSources/"
      ".idea/**/dataSources.ids"
      ".idea/**/dataSources.local.xml"
      ".idea/**/sqlDataSources.xml"
      ".idea/**/dynamic.xml"
      ".idea/**/uiDesigner.xml"
      ".idea/**/dbnavigator.xml"
      ".idea/**/gradle.xml"
      ".idea/**/libraries"
      "cmake-build-*/"
      ".idea/**/mongoSettings.xml"
      "*.iws"
      "atlassian-ide-plugin.xml"
      ".idea/replstate.xml"
      "com_crashlytics_export_strings.xml"
      "crashlytics.properties"
      "crashlytics-build.properties"
      "fabric.properties"
      ".idea/httpRequests"
      ".idea/caches/build_file_checksums.ser"
      "*.iml"
      "modules.xml"
      ".idea/misc.xml"
      "*.ipr"
      ".idea/**/sonarlint/"
      ".idea/**/sonarIssues.xml"
      ".idea/**/markdown-navigator.xml"
      ".idea/**/markdown-navigator/"
      ".fuse_hidden*"
      ".directory"
      ".Trash-*"
      ".nfs*"
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
      "Icon"
      "._*"
      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ".com.apple.timemachine.donotpresent"
      ".AppleDB"
      ".AppleDesktop"
      "Network Trash Folder"
      "Temporary Items"
      ".apdisk"
      "[._]*.s[a-v][a-z]"
      "[._]*.sw[a-p]"
      "[._]s[a-rt-v][a-z]"
      "[._]ss[a-gi-z]"
      "[._]sw[a-p]"
      "Session.vim"
      "Sessionx.vim"
      ".netrwhist"
      "tags"
      "[._]*.un~"
      ".vim"
      "Thumbs.db"
      "Thumbs.db:encryptable"
      "ehthumbs.db"
      "ehthumbs_vista.db"
      "*.stackdump"
      "[Dd]esktop.ini"
      "$RECYCLE.BIN/"
      "*.cab"
      "*.msi"
      "*.msix"
      "*.msm"
      "*.msp"
      "*.lnk"
    ];

  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
