{ config, lib, pkgs, ... }:

with lib; {

  # activeate bobthefish theme
  xdg.configFile."fish/conf.d/plugin-bobthefish.fish".text = mkAfter ''
    for f in $plugin_dir/*.fish
      source $f
    end
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
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-config";
          rev = "HEAD";
          sha256 = "0x1rs89pmj5i8md2ihaw7dq62rz0qgkfky9vply5nx3immd66y6v";
        };
      }

      # https://github.com/oh-my-fish/plugin-spark
      # FIXME install https://github.com/holman/spark
      {
        name = "omf-spark";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-spark";
          rev = "HEAD";
          sha256 = "0maglsr30ndhskwwysi8s6dy5pwhgifnhg63vlr00pw6yw33a160";
        };
      }

      # https://github.com/oh-my-fish/theme-bobthefish
      {
        name = "bobthefish";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "theme-bobthefish";
          rev = "HEAD";
          sha256 = "gp8qYWg4o9l5H+0WiLf7GL+DGM20OvzKAsowouC6ax0=";
        };
      }

      # https://github.com/oh-my-fish/plugin-foreign-env
      {
        name = "foreign-env";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "HEAD";
          sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
        };
      }

      # https://github.com/oh-my-fish/plugin-sudope
      # FIXME ESCAPE not working
      {
        name = "sudope";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-sudope";
          rev = "HEAD";
          sha256 = "1r6l79dzczl72gcqc4vwinvvjspzqvnjkrhhjkp54sb33f62281a";
        };
      }

      # https://github.com/jethrokuan/fzf
      # TODO checkout the docs
      # FIXME alt doesn't work -- e.g. Alt-C not working
      {
        name = "fzf";
        src = fetchFromGitHub {
          owner = "jethrokuan";
          repo = "fzf";
          rev = "HEAD";
          sha256 = "D20sR9H5lEh53nerhiuc5Ooid0AaD3Dcs85PgaNHFnk=";
        };
      }

      # https://github.com/oh-my-fish/plugin-osx
      {
        name = "osx";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-osx";
          rev = "HEAD";
          sha256 = "032yfxz10vypywfivggsam77b8zplmgafbc0gqks8cxhfy9hh9cd";
        };
      }

      # https://github.com/oh-my-fish/plugin-thefuck
      {
        name = "thefuck";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-thefuck";
          rev = "HEAD";
          sha256 = "0ih35vxvc05wc708i1ifr94s1p20k27bydqjlyk2gpv1cr8jf6j2";
        };
      }

      # https://github.com/oh-my-fish/plugin-cd
      {
        name = "cd";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-cd";
          rev = "HEAD";
          sha256 = "0q78d24wmkvn54c9blaylnjywr1562dgm2nc0vlb90b6n809vjmr";
        };
      }

      # https://github.com/edc/bass
      {
        name = "bass";
        src = fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "HEAD";
          sha256 = "VBqfBhHj0OyUmDzjak7OpSNxXlB0Xp1oG31To35u/rU=";
        };
      }


      # https://github.com/otms61/fish-pet
      {
        name = "pet";
        src = fetchFromGitHub {
          owner = "otms61";
          repo = "fish-pet";
          rev = "HEAD";
          sha256 =
            "sha256:0y8i3v2yp29r9m9cj5hyw6yd5jl1jzhq1ar4qlnd84kn80zahpsg";
        };
      }

      # https://github.com/joehillen/to-fish
      {
        name = "to";
        src = fetchFromGitHub {
          owner = "joehillen";
          repo = "to-fish";
          rev = "HEAD";
          sha256 = "YGNsg4HhL/jz7eFLpZn9tzfRNriofwzbuhrY+rq9sIE=";
        };
      }

      # https://github.com/oh-my-fish/plugin-wifi-password
      {
        name = "wifi-password";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-wifi-password";
          rev = "HEAD";
          sha256 = "1ayr4ircd1ys0gw0dfsagk4w3scfb3zbk32nk9648dzbsj7z7axn";
        };
      }

      # https://github.com/oh-my-fish/plugin-python
      {
        name = "python";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-python";
          rev = "HEAD";
          sha256 = "16nxd5w70rzrpxvlkn7xg592p6s1xh6v10anapfdm5p20azrkfnq";
        };
      }
    ];
  };
}
