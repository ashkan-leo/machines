{ gitUser, email, config, pkgs, lib, ... }:

let
  emailAddress = "ashkan.aleali@gmail.com";
  gitUserName = "ashkan-leo";

in {
  imports = [ ../../shell ../../term ../../mac/yabai ];

  home.packages = import ../../packages/x86_64-darwin.nix { inherit pkgs; }
    ++ import ../../packages/x86_64-universal.nix { inherit pkgs; };

  # Configure git username and email for this profile
  programs.git = {
    userName = gitUserName;
    userEmail = emailAddress;
  };
  programs.vim.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
