{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    # settings = { ; };
    extraConfig = "macos_option_as_alt yes";
  };

}
