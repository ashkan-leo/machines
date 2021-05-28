{ config, lib, pkgs, ... }:

{
  # NOTE The emacs build takes a very long time and the binary cache for mac os
  # is missing. Disable emacs overly for now.
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "sha256:11ab243scavmg0c69f3ynfqmyzhl8ra0ck6wmbzm66hvrcclxqbi";
    }))
  ];
}
