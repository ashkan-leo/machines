{ config, pkgs, lib, ... }:

{
  imports = [
    ../../shell/fish.nix
    ../../shell/broot.nix
    ../../shell/direnv.nix
    ../../shell/misc.nix

    ../../term/kitty.nix
    ../../term/alacritty.nix
    ../../term/oh-my-tmux.nix
    # ./modules/term/pet.nix

    # TODO implement spark
    # ./modules/tools/sparkling.nix

    # FIXME emacs causes yabai become unresponsive
    # FIXME for now use the homebrew installation
    # TODO fix the nix emacs installation and achieve nirvana
    # ./modules/editor/emacs.nix
  ];
  home.packages = import ../../packages/x86_64-darwin.nix { inherit pkgs; };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
