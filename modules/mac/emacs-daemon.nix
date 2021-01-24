{ config, lib, pkgs, ... }:

{
  services.emacs = {
    enable = true;

    # Install emacs Mac Port build
    package = pkgs.emacsMacport;
	
    exec = "~/.nix-profile/bin/emacs";
  };
}
