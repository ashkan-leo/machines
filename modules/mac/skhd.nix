{ config, lib, pkgs, ... }:

{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      ### alacritty terminal

      alt + shift + ctrl - 9 : alacritty
      fn - 9 : alacritty

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
  };
}
