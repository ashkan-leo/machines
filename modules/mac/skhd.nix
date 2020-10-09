{ config, lib, pkgs, ... }:

{
  services.skhd = {
    enable = true;
    skhdConfig = ''

      # yabai

      # The fn modifier has shift + alt + ctrl alternative
      # This is equivalent to "Meh"
      # The shift + fn has shift + alt + ctrl + cmd alternative
      # This is equivalent to "Hyper"

      ## focus windows
      cmd + shift - h : yabai -m window --focus west
      cmd + shift - j : yabai -m window --focus south
      cmd + shift - k : yabai -m window --focus north
      cmd + shift - l : yabai -m window --focus east

      ## warp windows
      ctrl + shift - h : yabai -m window --warp west
      ctrl + shift - j : yabai -m window --warp south
      ctrl + shift - k : yabai -m window --warp north
      ctrl + shift - l : yabai -m window --warp east

      ## swap windows
      alt + shift - h : yabai -m window --swap west
      alt + shift - j : yabai -m window --swap south
      alt + shift - k : yabai -m window --swap north
      alt + shift - l : yabai -m window --swap east

      ## change size of windows
      cmd + alt - d : yabai -m window --resize top:0:-40;\
                      yabai -m window --resize bottom:0:-40
      cmd + alt - a : yabai -m window --resize left:-40:0;\
                      yabai -m window --resize right:-40:0
      cmd + alt - s : yabai -m window --resize bottom:0:40;\
                      yabai -m window --resize top:0:40
      cmd + alt - h : yabai -m window --resize right:40:0;\
                      yabai -m window --resize left:40:0

      ## balance size of windows
      alt + shift - 0 : yabai -m space --balance

      ## make floating window fill screen
      alt + cmd - up : yabai -m window --grid 1:1:0:0:1:1

      ## make floating window fill left-half of screen
      alt + cmd - left : yabai -m window --grid 1:2:0:0:1:1

      ## make floating window fill right-half of screen
      alt + cmd - right : yabai -m window --grid 1:2:1:0:1:1

      ## focus display
      cmd + alt - r : yabai -m display --focus next
      cmd + alt - q : yabai -m display --focus prev

      ## throw window to display
      cmd + alt - i : yabai -m window --display next
      cmd + alt - o : yabai -m window --display prev

      ## throw window to display and follow focus
      cmd + ctrl - i : yabai -m window --display next;\
                      yabai -m display --focus next
      cmd + ctrl - o : yabai -m window --display prev;\
                      yabai -m display --focus prev

      ## throw space to display and follow focus
      cmd + alt + shift - i : yabai -m space --display next
      cmd + alt + shift - o : yabai -m space --display prev

      ## fast focus space
      fn - x : yabai -m space --focus recent
      fn - z : yabai -m space --focus prev
      fn - m : yabai -m space --focus next
      fn - 1 : yabai -m space --focus 1
      fn - 2 : yabai -m space --focus 2
      fn - 3 : yabai -m space --focus 3
      fn - 4 : yabai -m space --focus 4
      fn - 5 : yabai -m space --focus 5
      fn - 6 : yabai -m space --focus 6
      fn - 7 : yabai -m space --focus 7
      fn - 8 : yabai -m space --focus 8
      fn - 9 : yabai -m space --focus 9
      fn - 0 : yabai -m space --focus 10

      # Meh variations
      shift + alt + ctrl - x : yabai -m space --focus recent
      shift + alt + ctrl - z : yabai -m space --focus prev
      shift + alt + ctrl - m : yabai -m space --focus next
      shift + alt + ctrl - 1 : yabai -m space --focus 1
      shift + alt + ctrl - 2 : yabai -m space --focus 2
      shift + alt + ctrl - 3 : yabai -m space --focus 3
      shift + alt + ctrl - 4 : yabai -m space --focus 4
      shift + alt + ctrl - 5 : yabai -m space --focus 5
      shift + alt + ctrl - 6 : yabai -m space --focus 6
      shift + alt + ctrl - 7 : yabai -m space --focus 7
      shift + alt + ctrl - 8 : yabai -m space --focus 8
      shift + alt + ctrl - 9 : yabai -m space --focus 9
      shift + alt + ctrl - 0 : yabai -m space --focus 10

      ## send window to space and follow focus
      fn + shift - x : yabai -m window --space recent;\
                       yabai -m space --focus recent
      fn + shift - z : yabai -m window --space prev;\
                       yabai -m space --focus prev
      fn + shift - m : yabai -m window --space next;\
                       yabai -m space --focus next
      fn + shift - 1 : yabai -m window --space  1;\
                       yabai -m space --focus 1
      fn + shift - 2 : yabai -m window --space  2;\
                       yabai -m space --focus 2
      fn + shift - 3 : yabai -m window --space  3;\
                       yabai -m space --focus 3
      fn + shift - 4 : yabai -m window --space  4;\
                       yabai -m space --focus 4
      fn + shift - 5 : yabai -m window --space  5;\
                       yabai -m space --focus 5
      fn + shift - 6 : yabai -m window --space  6;\
                       yabai -m space --focus 6
      fn + shift - 7 : yabai -m window --space  7;\
                       yabai -m space --focus 7
      fn + shift - 8 : yabai -m window --space  8;\
                       yabai -m space --focus 8
      fn + shift - 9 : yabai -m window --space  9;\
                       yabai -m space --focus 9
      fn + shift - 0 : yabai -m window --space 10;\
                       yabai -m space --focus 10

      # Hyper variations
      cmd + alt + ctrl + shift - x : yabai -m window --space recent;\
                       yabai -m space --focus recent
      cmd + alt + ctrl + shift - z : yabai -m window --space prev;\
                       yabai -m space --focus prev
      cmd + alt + ctrl + shift - m : yabai -m window --space next;\
                       yabai -m space --focus next
      cmd + alt + ctrl + shift - 1 : yabai -m window --space  1;\
                       yabai -m space --focus 1
      cmd + alt + ctrl + shift - 2 : yabai -m window --space  2;\
                       yabai -m space --focus 2
      cmd + alt + ctrl + shift - 3 : yabai -m window --space  3;\
                       yabai -m space --focus 3
      cmd + alt + ctrl + shift - 4 : yabai -m window --space  4;\
                       yabai -m space --focus 4
      cmd + alt + ctrl + shift - 5 : yabai -m window --space  5;\
                       yabai -m space --focus 5
      cmd + alt + ctrl + shift - 6 : yabai -m window --space  6;\
                       yabai -m space --focus 6
      cmd + alt + ctrl + shift - 7 : yabai -m window --space  7;\
                       yabai -m space --focus 7
      cmd + alt + ctrl + shift - 8 : yabai -m window --space  8;\
                       yabai -m space --focus 8
      cmd + alt + ctrl + shift - 9 : yabai -m window --space  9;\
                       yabai -m space --focus 9
      cmd + alt + ctrl + shift - 0 : yabai -m window --space 10;\
                       yabai -m space --focus 10

      ## destroy space
      fn - q : yabai -m space --destroy

      shift + alt + ctrl - q : yabai -m space --destroy

      ## create space, move window and follow focus
      fn + shift - a : yabai -m space --create && \
                              index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
                              yabai -m window --space "''${index}" && \
                              yabai -m space --focus "''${index}"
      cmd + alt + ctrl + shift - a : yabai -m space --create && \
                                     index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
                                     yabai -m window --space "''${index}" && \
                                     yabai -m space --focus "''${index}"

      ## create space and follow focus
      fn + shift - s : yabai -m space --create;\
                       index="$(yabai -m query --displays --display | jq '.spaces[-1]')" && \
                       yabai -m space --focus "''${index}"
      cmd + alt + ctrl + shift - s : yabai -m space --create;\
                                     index="$(yabai -m query --displays --display | jq '.spaces[-1]')" && \
                                     yabai -m space --focus "''${index}"

      ## rotate tree
      cmd + alt - y : yabai -m space --rotate 90
      cmd + alt - n : yabai -m space --rotate 180
      cmd + alt - k : yabai -m space --rotate 270

      ## toggle window fullscreen zoom
      fn - f : yabai -m window --toggle zoom-fullscreen
      shift + alt + ctrl - f : yabai -m window --toggle zoom-fullscreen

      ## toggle window native fullscreen
      fn + shift - f : yabai -m window --toggle native-fullscreen
      cmd + alt + ctrl + shift - f : yabai -m window --toggle native-fullscreen

      ## toggle window split type
      fn - e : yabai -m window --toggle split
      shift + alt + ctrl - e : yabai -m window --toggle split

      ## float / unfloat window and center on screen
      fn - t : yabai -m window --toggle float;\
               yabai -m window --grid 4:4:1:1:2:2
      shift + alt + ctrl - t : yabai -m window --toggle float;\
                             yabai -m window --grid 4:4:1:1:2:2

      ## toggle sticky
      fn - s : yabai -m window --toggle sticky
      shift + alt + ctrl - s : yabai -m window --toggle sticky

      ## toggle sticky, float and resize to picture-in-picture size
      fn - p : yabai -m window --toggle sticky;\
               yabai -m window --grid 5:5:4:0:1:1
      shift + alt + ctrl - p : yabai -m window --toggle sticky;\
                             yabai -m window --grid 5:5:4:0:1:1
    '';
  };
}
