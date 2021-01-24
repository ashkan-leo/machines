{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        dimensions = {
          columns = 100;
          lines = 85;
        };
        padding = {
          x = 0;
          y = 0;
        };
        dynamic_padding = false;
        dynamic_title = true;
        decorations = "none";
      };

      colors = {
        # Solarized Dark
        #
        primary = {
          background = "0x002b36";
          foreground = "0x839496";
        };
        normal = {
          black = "0x073642";
          red = "0xdc322f";
          green = "0x859900";
          yellow = "0xb58900";
          blue = "0x268bd2";
          magenta = "0xd33682";
          cyan = "0x2aa198";
          white = "0xeee8d5";
        };
        bright = {
          black = "0x002b36";
          red = "0xcb4b16";
          green = "0x586e75";
          yellow = "0x657b83";
          blue = "0x839496";
          magenta = "0x6c71c4";
          cyan = "0x93a1a1";
          white = "0xfdf6e3";
        };
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = {
        size = 14.0;
        use_thin_strokes = true;

        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Extra Bold Italic";
        };
      };

      bell = {
        animation = "EaseOutExpo";
        color = "0xffffff";
        duration = 0;
      };

      cursor = {
        style = "Beam";
        vi_mode_style = "Block";
      };

      shell = {
        # Use fish as the default shell
        program = "fish";
        # Auto start tmux or attach to the server if it's running
        args = [
          "-l"
          "-c"
          "tmux attach-session -t Z || tmux new-session -t Z && tmux attach-session -t Z"
        ];
      };

      mouse.hide_when_typing = true;
      selection.save_to_clipboard = true;
      live_config_reload = true;
      alt_send_esc = false;

      key_bindings = [
        {
          key = "J";
          mods = "Alt";
          chars = "\\x1bj";
        }
        {
          key = "N";
          mods = "Command";
          action = "SpawnNewInstance";
        }

        # NOTE control characters don't work in Alacritty
        # NOTE when using non-QWERTY keyboard layouts
        # NOTE define them here to make them work
        #
        #
        # https://donsnotes.com/tech/charsets/ascii.html

        {
          key = "A";
          mods = "Control";
          chars = "\\x01";
        }
        {
          key = "B";
          mods = "Control";
          chars = "\\x02";
        }
        {
          key = "C";
          mods = "Control";
          chars = "\\x03";
        }
        {
          key = "D";
          mods = "Control";
          chars = "\\x04";
        }
        {
          key = "E";
          mods = "Control";
          chars = "\\x05";
        }
        {
          key = "F";
          mods = "Control";
          chars = "\\x06";
        }
        {
          key = "G";
          mods = "Control";
          chars = "\\x07";
        }
        {
          key = "H";
          mods = "Control";
          chars = "\\x08";
        }
        {
          key = "I";
          mods = "Control";
          chars = "\\x09";
        }
        {
          key = "J";
          mods = "Control";
          chars = "\\x0A";
        }
        {
          key = "K";
          mods = "Control";
          chars = "\\x0B";
        }
        {
          key = "L";
          mods = "Control";
          chars = "\\x0C";
        }
        {
          key = "M";
          mods = "Control";
          chars = "\\x0D";
        }
        {
          key = "N";
          mods = "Control";
          chars = "\\x0E";
        }
        {
          key = "O";
          mods = "Control";
          chars = "\\x0F";
        }
        {
          key = "P";
          mods = "Control";
          chars = "\\x10";
        }
        {
          key = "Q";
          mods = "Control";
          chars = "\\x11";
        }
        {
          key = "R";
          mods = "Control";
          chars = "\\x12";
        }
        {
          key = "S";
          mods = "Control";
          chars = "\\x13";
        }
        {
          key = "T";
          mods = "Control";
          chars = "\\x14";
        }
        {
          key = "U";
          mods = "Control";
          chars = "\\x15";
        }
        {
          key = "V";
          mods = "Control";
          chars = "\\x16";
        }
        {
          key = "W";
          mods = "Control";
          chars = "\\x17";
        }
        {
          key = "X";
          mods = "Control";
          chars = "\\x18";
        }
        {
          key = "Y";
          mods = "Control";
          chars = "\\x19";
        }
        {
          key = "Z";
          mods = "Control";
          chars = "\\x1A";
        }
        # {
        #   key = "[";
        #   mods = "Control";
        #   chars = "\\x1B";
        # }
        # {
        #   key = "\\";
        #   mods = "Control";
        #   chars = "\\x1C";
        # }
        # {
        #   key = "]";
        #   mods = "Control";

        # }
        # {
        #   key = "?";
        #   mods = "Control";
        #   chars = "\\x7F";
        # }
      ];
    };
  };
}
