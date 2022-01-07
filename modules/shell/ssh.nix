{ config, lib, pkgs, ... }:

with lib; {
  programs.ssh = {
    forwardAgent = true;
    enable = true;
    extraConfig = ''
      # remember to create this key by ssh-keygen -t ed25519
      IdentityFile ~/.ssh/id_ed25519
    '';
  };
}
