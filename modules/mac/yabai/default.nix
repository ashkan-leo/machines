{ config, lib, pkgs, ... }:

{
  services.yabai = {
    enable = true;
    # extraConfig = builtins.readFile ./yabairc;
    extraConfig = ''
    yabai -m config active_window_opacity 0.900000
    yabai -m config bottom_padding 6
    yabai -m config extraConfig yabai -m rule --add app="System Preferences" manage=off
    yabai -m rule --add app="1Password" manage=off
    yabai -m rule --add app="Messages" manage=off
    yabai -m rule --add app="Dictionary" manage=off
    yabai -m rule --add app="Telegram" manage=off
    yabai -m rule --add app="BetterTouchTool" manage=off
    yabai -m rule --add app="App Store" manage=off
    yabai -m rule --add app="FaceTime" manage=off
    yabai -m rule --add app="Wally" manage=off
    yabai -m rule --add app="Alfred Preferences" manage=off
    yabai -m rule --add app="Emacs" manage=on

    yabai -m config layout bsp
    yabai -m config left_padding 6
    yabai -m config mouse_action1 move
    yabai -m config mouse_action2 resize
    yabai -m config mouse_follows_focus on
    yabai -m config mouse_modifier fn
    yabai -m config normal_window_opacity 0.800000
    yabai -m config right_padding 6
    yabai -m config top_padding 4
    yabai -m config window_gap 6
    yabai -m config window_opacity on
    yabai -m config window_placement second_child
    '';
  };
  # FIXME need to mark the file as executable
  # xdg.configFile."yabai/yabairc".text = builtins.readFile ./yabairc;

  # NOTE disable the yabai services in nix. It is not maintained
}
