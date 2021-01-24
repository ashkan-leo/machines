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
          sha256 = "1fssb5bqd2d7856gsylf93d28n3rw4rlqkhbg120j5ng27c7v7lq";
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

      # https://github.com/oh-my-fish/plugin-vi-mode
      # {
      #   name = "vi-mode";
      #   src = fetchFromGitHub {
      #     owner = "oh-my-fish";
      #     repo = "plugin-vi-mode";
      #     rev= "HEAD";
      #     sha256 = "130cqgv6f973j4ipbdk60adgf6h9kly2x3l1521idd5nmc7dy6qb";
      #   };
      # }

      # https://github.com/oh-my-fish/plugin-gi
      # FIXME
      # {
      #   name = "plugin-gi";
      #   src = fetchFromGitHub {
      #     owner = "oh-my-fish";
      #     repo = "plugin-gi";
      #     rev= "b80c560dddfe489c3e2dc070cbb84ae3dd15cd61";
      #     sha256 = "0pj4vypg3c7vs397bq9qk24p25i4nrwz88aw0m6an6nk8va3nh9r";
      #   };
      # }

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

      # https://github.com/jethrokuan/z
      # TODO  Using fasd instead of z
      # {
      #   name = "z";
      #   src = fetchFromGitHub {
      #     owner = "jethrokuan";
      #     repo = "z";
      #     rev = "HEAD";
      #     sha256 = "0kykhan9rdzy8anif5jp1iv3djrakhwk2arll3k93vaxm3np0gfm";
      #   };
      # }

      # https://github.com/oh-my-fish/plugin-fasd
      {
        name = "fasd";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-fasd";
          rev = "HEAD";
          sha256 = "06v37hqy5yrv5a6ssd1p3cjd9y3hnp19d3ab7dag56fs1qmgyhbs";
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
          sha256 = "1df1jkrq778yfi5mh2wk4hzszqxvlkc59smiicy9qa84cw0092ds";
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
          sha256 =
            "sha256:0ppmajynpb9l58xbrcnbp41b66g7p0c9l2nlsvyjwk6d16g4p4gy";
        };
      }

      # https://github.com/evanlucas/fish-kubectl-completions
      {
        name = "kubectl-completions";
        src = fetchFromGitHub {
          owner = "evanlucas";
          repo = "fish-kubectl-completions";
          rev = "HEAD";
          sha256 = "1jk6kly62h8qpwqz71fpa7wyb3xwkfsp6b3q8p3ciqv62c0drfkk";
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
          sha256 = "12kcf6rzwp0fcjhf9hak22b5j1a616s4m4zmh4kyxf39gy03ci1w";
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

      # https://github.com/oh-my-fish/plugin-aws
      # {
      #   name = "aws";
      #   src = fetchFromGitHub {
      #     owner = "oh-my-fish";
      #     repo = "plugin-aws";
      #     rev = "HEAD";
      #     sha256 = "03yqrb1l7wmp5hzig9klf9gsdg8ncrky0bkvynzy8jxy9yvhpg7j";
      #   };
      # }

      # https://github.com/oh-my-fish/plugin-weather
      {
        name = "weather";
        src = fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-weather";
          rev = "HEAD";
          sha256 = "19xg0779fax47skifmshb915684l4k1v2mv8cg8f2j38fdq28cb3";
        };
      }

      # https://github.com/acomagu/fish-async-prompt
      # NOTE this extension ignores prompt theme variables
      # NOTE and is unpredictable specially when using tmux
      # {
      #   name = "async-prompt";
      #   src = fetchFromGitHub {
      #     owner = "acomagu";
      #     repo = "fish-async-prompt";
      #     rev = "HEAD";
      #     sha256 = "18nxl53nc0hwpilgp2izz89mjmklh1r2iaacz9lw5kg4xw2h75hc";
      #   };
      # }

    ];
  };
}
