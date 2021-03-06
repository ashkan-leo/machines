{ config, lib, pkgs, ... }:

{
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = false; # Ensure SIP is disabled for this to work!

    config = {
      layout = "bsp";

      window_placement = "second_child";

      mouse_modifier = "fn";
      mouse_follows_focus = "on";
      focus_follows_mouse = "on";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      # focus_follows_mouse = "autoraise";

      top_padding = 4;
      bottom_padding = 6;
      left_padding = 6;
      right_padding = 6;
      window_gap = 6;

      extraConfig = ''
        yabai -m rule --add label=preferences app="System Preferences" manage=off
        yabai -m rule --add label=1password app="1Password" manage=off
        yabai -m rule --add label=messages app="Messages" manage=off
        yabai -m rule --add label=dictionary app="Dictionary" manage=off
        yabai -m rule --add label=telegram app="Telegram" manage=off
        yabai -m rule --add label=btt app="BetterTouchTool" manage=off
        yabai -m rule --add label=appstore app="App Store" manage=off
        yabai -m rule --add label=facetime app="FaceTime" manage=off
        yabai -m rule --add label=wally app="Wally" manage=off
        yabai -m rule --add label=alfred app="Alfred Preferences" manage=off

        yabai -m rule --add label=emacs app=Emacs manage=on
      '';

      # mouse_action2 = "resize";
      # window_shadow = "float";

      # FIXME turning on opacity will cause the OS to crash
      # NOTE I think it has been turned off upstream
      # So turning it on has no effect at all
      # window_opacity = "on";
      # active_window_opacity = 0.9;
      # normal_window_opacity = 0.8;
    };
  };
}
