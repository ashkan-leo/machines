{ config, lib, pkgs, ... }:

with lib; {
  programs.git = {
    enable = true;

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

    aliases = {
      co = "checkout";
      cob = "checkout -b";
      cm = "commit -m";
      rv = "remote -v";
      d = "diff";
      se = "!git rev-list --all | xargs git grep -F";
      p = "!git pull --ff-only";
      fixup =
        "!sh -c 'REV=$(git rev-parse $1) && git commit --fixup $@ && git rebase -i --autostash --autosquash $REV^' -";
      cleanup =
        "!git branch --merged | grep -v -P '^\\*|master|main|develop' | xargs -n1 -r git branch -d";
      del = "branch -D";
      br =
        "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
      undo = "reset HEAD~1 --mixed";
      save = "save = !git add -A && git commit -m 'chore: commit save point";
      res = "!git reset --hard";
      done = "!git push origin HEAD";
      lg = ''
        !git log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30'';
    };

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
}
