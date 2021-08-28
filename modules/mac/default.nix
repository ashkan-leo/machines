{ config, lib, pkgs, ... }:

{
  imports =
    [ ./skhd.nix ./yabai.nix ./system.nix ./programs.nix ./services.nix ./homebrew];

  environment = {
    # a list of common environment vars (editor, etc.)
    variables = import ../env/vars.nix;

    # shells managed by nix is listed here
    # you can change to them by running chsh -s /run/current-system/sw/bin/fish
    shells = with pkgs; [bashInteractive fish zsh];
  };

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix = {
    maxJobs = 8;
    buildCores = 0;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

}
