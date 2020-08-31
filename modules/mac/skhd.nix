{ config, lib, pkgs, ... }:

{
  services.skhd = {
    enable = true;
    skhdConfig = ''

      # yabai

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
      rcmd + ralt - d : yabai -m window --resize top:0:-40;\
                        yabai -m window --resize bottom:0:-40
      rcmd + ralt - a : yabai -m window --resize left:-40:0;\
                        yabai -m window --resize right:-40:0
      rcmd + ralt - s : yabai -m window --resize bottom:0:40;\
                        yabai -m window --resize top:0:40
      rcmd + ralt - h : yabai -m window --resize right:40:0;\
                        yabai -m window --resize left:40:0

      ## balance size of windows
      alt + shift - 0 : yabai -m space --balance

      ## make floating window fill screen
      alt + cmd - up : yabai -m window --grid 1:1:0:0:1:1

      ## make floating window fill left-half of screen
      alt + cmd - left : yabai -m window --grid 1:2:0:0:1:1

      ## make floating window fill right-half of screen
      alt + cmd - right : yabai -m window --grid 1:2:1:0:1:1

      ## destroy space
      fn - q : yabai -m space --destroy

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

      ## create space, move window and follow focus
      fn + shift - a : yabai -m space --create && \
                              index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
                              yabai -m window --space "''${index}" && \
                              yabai -m space --focus "''${index}"

      ## create space and follow focus
      fn + shift - s : yabai -m space --create;\
                       index="$(yabai -m query --displays --display | jq '.spaces[-1]')" && \
                       yabai -m space --focus "''${index}"

      ## rotate tree
      cmd + alt - y : yabai -m space --rotate 90
      cmd + alt - n : yabai -m space --rotate 180
      cmd + alt - k : yabai -m space --rotate 270

      ## toggle window fullscreen zoom
      fn - f : yabai -m window --toggle zoom-fullscreen

      ## toggle window native fullscreen
      fn + shift - f : yabai -m window --toggle native-fullscreen

      ## toggle window split type
      fn - e : yabai -m window --toggle split

      ## float / unfloat window and center on screen
      fn - t : yabai -m window --toggle float;\
               yabai -m window --grid 4:4:1:1:2:2

      ## toggle sticky
      fn - s : yabai -m window --toggle sticky

      ## toggle sticky, float and resize to picture-in-picture size
      fn - p : yabai -m window --toggle sticky;\
               yabai -m window --grid 5:5:4:0:1:1
    '';
  };
}
