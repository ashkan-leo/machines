{ config, lib, pkgs, ... }:

{
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = true; # Ensure SIP is disabled for this to work!

    config = {
      layout = "bsp";

      window_placement = "second_child";

      mouse_modifier = "fn";
      mouse_follows_focus = "on";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      # focus_follows_mouse = "autoraise";

      top_padding = 4;
      bottom_padding = 6;
      left_padding = 6;
      right_padding = 6;
      window_gap = 6;

      # mouse_action2 = "resize";
      # window_shadow = "float";

      # window_opacity = "on";
      # active_window_opacity = 0.95;
      # normal_window_opacity = 0.88;
    };
  };
}
