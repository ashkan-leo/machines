{ gitUser, email, config, pkgs, lib, ... }:

let
  emailAddress = "ashkan.aleali@epsilon.com";
  gitUserName = "aaleali";

in {
  imports = [ ../../shell ../../term ];

  home.packages = import ../../packages/x86_64-darwin.nix { inherit pkgs; }
    ++ import ../../packages/x86_64-universal.nix { inherit pkgs; };

  # Configure git username and email for this profile
  programs.git = {
    userName = gitUserName;
    userEmail = emailAddress;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
