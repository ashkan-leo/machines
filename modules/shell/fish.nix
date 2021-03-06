{ config, lib, pkgs, ... }:

with lib; {

  # activeate bobthefish theme
  xdg.configFile."fish/conf.d/plugin-bobthefish.fish".text = mkAfter ''
    for f in $plugin_dir/*.fish
      source $f
    end
  '';

  # activate z.lua
  xdg.configFile."fish/conf.d/z.fish".text = mkAfter ''
    lua /path/to/z.lua --init fish | source
    set -gx _ZL_CD cd
  '';

  # FIXME this doesn't work
  # define custom keybindings
  xdg.configFile."fish/functions/fish_user_key_bindings.fish".text = mkAfter ''
    function fish_user_key_bindings
      bind \cs 'pet-select --layout=bottom-up'
    end
  '';
  programs.fish = {
    enable = true;

    shellAliases = import ./aliases.nix;

    shellAbbrs = import ./abbreviations.nix;

    # FIXME terrible hack
    # shellInit = ''
    #   bass source /nix/store/lx21x6h12sqs00a2rfnkcjmd84shbjiy-set-environment
    # '';

    # define the custom keybindings
    # interactiveShellInit = ''
    #   function fish_user_key_bindings
    #     bind \cs 'pet-select --layout=bottom-up'
    #   end
    # '';

    plugins = with pkgs; [

      # https://github.com/oh-my-fish/plugin-config
      # omf under the hood stuff
      {
        name = "omf-config";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-config";
          rev = "13c424efb73b153d9b8ad92916cf51159d44099d";
          sha256 = "23hjWq1xdFs8vTv56ebD4GdhcDtcwShaRbHIehPSOXQ=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/lilyball/nix-env.fish
      # nix-env
      {
        name = "nix-env";
        src = fetchFromGitHub {
          owner = "lilyball";
          repo = "nix-env.fish";
          rev = "a3c55307dce38c73485eac1f654c8f392341bda2";
          sha256 = "7NDd7zrkYjTlvA5A1zhksZsc0aDNB4DVgmzRJHaxwIY=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/oh-my-fish/plugin-spark
      # FIXME install https://github.com/holman/spark
      {
        name = "omf-spark";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-spark";
          rev = "ad857daf57f6f450dd1cf5e8a5d63136bdbf7234";
          sha256 = "uqUQ/O6euPSMIeIXgVuLTxvaB66w/V5xh9GWBQuXgTo=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/oh-my-fish/theme-bobthefish
      {
        name = "bobthefish";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "theme-bobthefish";
          rev = "626bd39b002535d69e56adba5b58a1060cfb6d7b";
          sha256 = "zUngqEZgHLmlyvoiVO3MwJTSFsYD7t3XiP6yMzmMkBs=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/oh-my-fish/plugin-foreign-env
      {
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
          sha256 = "er1KI2xSUtTlQd9jZl1AjqeArrfBxrgBLcw5OqinuAM=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/oh-my-fish/plugin-sudope
      # FIXME ESCAPE not working
      {
        name = "sudope";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-sudope";
          rev = "bfb525e6d087ade031bf30a51f168ad07592f2df";
          sha256 = "KiAhjBtjaVLulBDmKe3G/2q5t418E4bZE4d+9ls61OQ=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/jethrokuan/fzf
      # TODO checkout the docs
      # FIXME alt doesn't work -- e.g. Alt-C not working
      {
        name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "fzf";
          rev = "8ee7cf502637a9dd7d0cd96ead67c631a25e49d9";
          sha256 = "D20sR9H5lEh53nerhiuc5Ooid0AaD3Dcs85PgaNHFnk=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/oh-my-fish/plugin-osx
      {
        name = "osx";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-osx";
          rev = "27039b251201ec2e70d8e8052cbc59fa0ac3b3cd";
          sha256 = "jSUIk3ewM6QnfoAtp16l96N1TlX6vR0d99dvEH53Xgw=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/oh-my-fish/plugin-thefuck
      {
        name = "thefuck";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-thefuck";
          rev = "3570c4464bdfd0f312e22a0b407a8c0ba98b7e0d";
          sha256 = "QhonUWZh3yempxI3v46YQNygScouhojAYbwAtvsuA0Y=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/oh-my-fish/plugin-cd
      {
        name = "cd";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-cd";
          rev = "c171d3bd1c68e5c22b87769497502c559de37aff";
          sha256 = "ucqdALJmgbToBsyK+powJWTupaVe0ZUYKXbPyolo6GA=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/edc/bass
      {
        name = "bass";
        src = pkgs.fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "df4a1ebf8c0536e4bd7b7828a4c0dcb2b7b5d22b";
          sha256 = "VBqfBhHj0OyUmDzjak7OpSNxXlB0Xp1oG31To35u/rU=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/otms61/fish-pet
      {
        name = "pet";
        src = pkgs.fetchFromGitHub {
          owner = "otms61";
          repo = "fish-pet";
          rev = "c784c19b536471bd6ce403e2c5d06f17118362ca";
          sha256 = "T1+oPkB2EtQsxSSrgOGXgcrSvOEeFslSTTmJ68UeEXk=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/joehillen/to-fish
      {
        name = "to";
        src = pkgs.fetchFromGitHub {
          owner = "joehillen";
          repo = "to-fish";
          rev = "9e2ff18724212849bdf0f95a4f25b7b613013bb4";
          sha256 = "YGNsg4HhL/jz7eFLpZn9tzfRNriofwzbuhrY+rq9sIE=";
          fetchSubmodules = true;
        };
      }

      # https://github.com/oh-my-fish/plugin-wifi-password
      {
        name = "wifi-password";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-wifi-password";
          rev = "7aea30350d64c62221b1371f9234aba039ab964b";
          sha256 = "tqvzj9TrN0RMmlaMuf5YjunByXxKuwb4A9qHxnIk2as=";
          fetchSubmodules = true;
        };
      }
    ];
  };
}
