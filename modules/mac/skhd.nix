{ config, lib, pkgs, ... }:

{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      ### yabai

      # NOTE I use the following convention to ensure I can find all the keys
      # on all my keyboards
      # fn = alt + shift + ctrl (Meh)
      # fn + shift = alt + shift + ctrl + cmd (Hyper)
      #
      # NOTE The layout is optimized for the Workman layout.
      # "hjkl" keys are mapped to "yneo"

      ## focus windows
      fn - y: yabai -m window --focus west
      fn - n : yabai -m window --focus south
      fn - e : yabai -m window --focus north
      fn - o : yabai -m window --focus east
      # __________
      alt + shift + ctrl - y: yabai -m window --focus west
      alt + shift + ctrl - n : yabai -m window --focus south
      alt + shift + ctrl - e : yabai -m window --focus north
      alt + shift + ctrl - o : yabai -m window --focus east

      ## warp windows
      fn - j : yabai -m window --warp west
      fn - f : yabai -m window --warp south
      fn - u : yabai -m window --warp north
      fn - p : yabai -m window --warp east
      # __________
      alt + shift + ctrl - j : yabai -m window --warp west
      alt + shift + ctrl - f : yabai -m window --warp south
      alt + shift + ctrl - u : yabai -m window --warp north
      alt + shift + ctrl - p : yabai -m window --warp east

      ## swap windows
      fn - k : yabai -m window --swap west
      fn - l : yabai -m window --swap south
      fn - 0x2B : yabai -m window --swap north
      fn - 0x2F : yabai -m window --swap east
      # __________
      alt + shift + ctrl - k : yabai -m window --swap west
      alt + shift + ctrl - l : yabai -m window --swap south
      alt + shift + ctrl - 0x2B : yabai -m window --swap north
      alt + shift + ctrl - 0x2F : yabai -m window --swap east
      # NOTE 0x2B and 0x2F are codes for "," and "."

      ## change size of windows
      fn - d : yabai -m window --resize top:0:-40;\
               yabai -m window --resize bottom:0:-40
      fn - a : yabai -m window --resize left:-40:0;\
               yabai -m window --resize right:-40:0
      fn - s : yabai -m window --resize bottom:0:40;\
               yabai -m window --resize top:0:40
      fn - h : yabai -m window --resize right:40:0;\
               yabai -m window --resize left:40:0
      # __________
      alt + shift + ctrl - d : yabai -m window --resize top:0:-40;\
                               yabai -m window --resize bottom:0:-40
      alt + shift + ctrl - a : yabai -m window --resize left:-40:0;\
                               yabai -m window --resize right:-40:0
      alt + shift + ctrl - s : yabai -m window --resize bottom:0:40;\
                               yabai -m window --resize top:0:40
      alt + shift + ctrl - h : yabai -m window --resize right:40:0;\
                               yabai -m window --resize left:40:0

      ## focus display
      fn - q : yabai -m display --focus next
      fn - r : yabai -m display --focus prev
      # __________
      alt + shift + ctrl - q : yabai -m display --focus next
      alt + shift + ctrl - r : yabai -m display --focus prev

      ## throw window to display
      fn - w : yabai -m window --display next
      fn - b : yabai -m window --display prev
      # __________
      alt + shift + ctrl - w : yabai -m window --display next
      alt + shift + ctrl - b : yabai -m window --display prev

      ## throw window to display and follow focus
      fn - z : yabai -m window --display next;\
               yabai -m display --focus next
      fn - m : yabai -m window --display prev;\
               yabai -m display --focus prev
      # __________
      alt + shift + ctrl - z : yabai -m window --display next;\
                               yabai -m display --focus next
      alt + shift + ctrl - m : yabai -m window --display prev;\
                               yabai -m display --focus prev

      # FIXME space commands require yabai scripting addtion.
      ## fast focus space
      fn - 0 : yabai -m space --focus recent
      fn - 8 : yabai -m space --focus prev
      fn - 9 : yabai -m space --focus next

      fn - 1 : yabai -m space --focus 1
      fn - 2 : yabai -m space --focus 2
      fn - 3 : yabai -m space --focus 3
      fn - 4 : yabai -m space --focus 4
      fn - 5 : yabai -m space --focus 5
      fn - 6 : yabai -m space --focus 6
      fn - 7 : yabai -m space --focus 7
      # fn - 8 : yabai -m space --focus 8
      # fn - 9 : yabai -m space --focus 9
      # fn - 0 : yabai -m space --focus 10
      # __________
      alt + shift + ctrl - 1 : yabai -m space --focus 1
      alt + shift + ctrl - 2 : yabai -m space --focus 2
      alt + shift + ctrl - 3 : yabai -m space --focus 3
      alt + shift + ctrl - 4 : yabai -m space --focus 4
      alt + shift + ctrl - 5 : yabai -m space --focus 5
      alt + shift + ctrl - 6 : yabai -m space --focus 6
      alt + shift + ctrl - 7 : yabai -m space --focus 7
      # alt + shift + ctrl - 8 : yabai -m space --focus 8
      # alt + shift + ctrl - 9 : yabai -m space --focus 9
      # alt + shift + ctrl - 0 : yabai -m space --focus 10

      ## rotate tree
      fn - x : yabai -m space --rotate 90
      # __________
      alt + shift + ctrl - x : yabai -m space --rotate 90

      ## toggle window fullscreen zoom
      fn - g : yabai -m window --toggle zoom-fullscreen
      # __________
      alt + shift + ctrl - g : yabai -m window --toggle zoom-fullscreen

      # ## toggle window native fullscreen
      # fn + shift - f : yabai -m window --toggle native-fullscreen
      # cmd + alt + ctrl + shift - f : yabai -m window --toggle native-fullscreen

      ## toggle window split type
      fn - i : yabai -m window --toggle split
      # __________
      alt + shift + ctrl - i : yabai -m window --toggle split

      ## float / unfloat window and center on screen
      fn - t : yabai -m window --toggle float;\
               yabai -m window --grid 4:4:1:1:2:2
      # __________
      alt + shift + ctrl - t : yabai -m window --toggle float;\
                               yabai -m window --grid 4:4:1:1:2:2
    '';
    # skhdConfig = ''
    #   # FIXME Emacs
    #   # FIXME not loading the configuration
    #   # cmd + shift - e : nix-shell -p zsh --run "open /run/current-system/Applications/Emacs.app/Contents/MacOS/Emacs"

    #   ## balance size of windows
    #   alt + shift - 0 : yabai -m space --balance

    #   ## make floating window fill screen
    #   alt + cmd - up : yabai -m window --grid 1:1:0:0:1:1

    #   ## make floating window fill left-half of screen
    #   alt + cmd - left : yabai -m window --grid 1:2:0:0:1:1

    #   ## make floating window fill right-half of screen
    #   alt + cmd - right : yabai -m window --grid 1:2:1:0:1:1

    #   ## send window to space and follow focus
    #   fn + shift - x : yabai -m window --space recent;\
    #                    yabai -m space --focus recent
    #   fn + shift - z : yabai -m window --space prev;\
    #                    yabai -m space --focus prev
    #   fn + shift - m : yabai -m window --space next;\
    #                    yabai -m space --focus next
    #   fn + shift - 1 : yabai -m window --space  1;\
    #                    yabai -m space --focus 1
    #   fn + shift - 2 : yabai -m window --space  2;\
    #                    yabai -m space --focus 2
    #   fn + shift - 3 : yabai -m window --space  3;\
    #                    yabai -m space --focus 3
    #   fn + shift - 4 : yabai -m window --space  4;\
    #                    yabai -m space --focus 4
    #   fn + shift - 5 : yabai -m window --space  5;\
    #                    yabai -m space --focus 5
    #   fn + shift - 6 : yabai -m window --space  6;\
    #                    yabai -m space --focus 6
    #   fn + shift - 7 : yabai -m window --space  7;\
    #                    yabai -m space --focus 7
    #   fn + shift - 8 : yabai -m window --space  8;\
    #                    yabai -m space --focus 8
    #   fn + shift - 9 : yabai -m window --space  9;\
    #                    yabai -m space --focus 9
    #   fn + shift - 0 : yabai -m window --space 10;\
    #                    yabai -m space --focus 10

    #   # Hyper variations
    #   cmd + alt + ctrl + shift - x : yabai -m window --space recent;\
    #                    yabai -m space --focus recent
    #   cmd + alt + ctrl + shift - z : yabai -m window --space prev;\
    #                    yabai -m space --focus prev
    #   cmd + alt + ctrl + shift - m : yabai -m window --space next;\
    #                    yabai -m space --focus next
    #   cmd + alt + ctrl + shift - 1 : yabai -m window --space  1;\
    #                    yabai -m space --focus 1
    #   cmd + alt + ctrl + shift - 2 : yabai -m window --space  2;\
    #                    yabai -m space --focus 2
    #   cmd + alt + ctrl + shift - 3 : yabai -m window --space  3;\
    #                    yabai -m space --focus 3
    #   cmd + alt + ctrl + shift - 4 : yabai -m window --space  4;\
    #                    yabai -m space --focus 4
    #   cmd + alt + ctrl + shift - 5 : yabai -m window --space  5;\
    #                    yabai -m space --focus 5
    #   cmd + alt + ctrl + shift - 6 : yabai -m window --space  6;\
    #                    yabai -m space --focus 6
    #   cmd + alt + ctrl + shift - 7 : yabai -m window --space  7;\
    #                    yabai -m space --focus 7
    #   cmd + alt + ctrl + shift - 8 : yabai -m window --space  8;\
    #                    yabai -m space --focus 8
    #   cmd + alt + ctrl + shift - 9 : yabai -m window --space  9;\
    #                    yabai -m space --focus 9
    #   cmd + alt + ctrl + shift - 0 : yabai -m window --space 10;\
    #                    yabai -m space --focus 10

    #   ## destroy space
    #   fn - q : yabai -m space --destroy

    #   shift + alt + ctrl - q : yabai -m space --destroy

    #   ## create space, move window and follow focus
    #   fn + shift - a : yabai -m space --create && \
    #                           index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
    #                           yabai -m window --space "''${index}" && \
    #                           yabai -m space --focus "''${index}"
    #   cmd + alt + ctrl + shift - a : yabai -m space --create && \
    #                                  index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
    #                                  yabai -m window --space "''${index}" && \
    #                                  yabai -m space --focus "''${index}"

    #   ## create space and follow focus
    #   fn + shift - s : yabai -m space --create;\
    #                    index="$(yabai -m query --displays --display | jq '.spaces[-1]')" && \
    #                    yabai -m space --focus "''${index}"
    #   cmd + alt + ctrl + shift - s : yabai -m space --create;\
    #                                  index="$(yabai -m query --displays --display | jq '.spaces[-1]')" && \
    #                                  yabai -m space --focus "''${index}"

    #   ## rotate tree
    #   cmd + alt - y : yabai -m space --rotate 90
    #   cmd + alt - n : yabai -m space --rotate 180
    #   cmd + alt - k : yabai -m space --rotate 270

    #   ## toggle window fullscreen zoom
    #   fn - f : yabai -m window --toggle zoom-fullscreen
    #   shift + alt + ctrl - f : yabai -m window --toggle zoom-fullscreen

    #   ## toggle window native fullscreen
    #   fn + shift - f : yabai -m window --toggle native-fullscreen
    #   cmd + alt + ctrl + shift - f : yabai -m window --toggle native-fullscreen

    #   ## toggle window split type
    #   fn - e : yabai -m window --toggle split
    #   shift + alt + ctrl - e : yabai -m window --toggle split

    #   ## float / unfloat window and center on screen
    #   fn - t : yabai -m window --toggle float;\
    #            yabai -m window --grid 4:4:1:1:2:2
    #   shift + alt + ctrl - t : yabai -m window --toggle float;\
    #                          yabai -m window --grid 4:4:1:1:2:2

    #   ## toggle sticky
    #   fn - s : yabai -m window --toggle sticky
    #   shift + alt + ctrl - s : yabai -m window --toggle sticky

    #   ## toggle sticky, float and resize to picture-in-picture size
    #   fn - p : yabai -m window --toggle sticky;\
    #            yabai -m window --grid 5:5:4:0:1:1
    #   shift + alt + ctrl - p : yabai -m window --toggle sticky;\
    #                          yabai -m window --grid 5:5:4:0:1:1
    # '';
  };
}
