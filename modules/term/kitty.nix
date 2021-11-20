{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = false;

    # settings = { ; };
    extraConfig = "macos_option_as_alt yes";
  };

}
