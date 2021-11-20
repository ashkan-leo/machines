{ config, lib, pkgs, ... }:

{
  xdg.configFile."yabai/yabairc".text = builtins.readFile ./yabairc;

  # NOTE disable the yabai services in nix. It is not maintained
}
