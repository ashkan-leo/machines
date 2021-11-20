{ config, lib, pkgs, ... }:

with lib; {
  programs.ssh = {
    forwardAgent = true;
    enable = true;
    extraConfig = ''
      # remember to create this key by ssh-keygen -t ed25519
      IdentityFile ~/.ssh/id_ed25519
    '';
    matchBlocks = {
      "learner" = {
        hostname = "192.168.1.101";
        user = "ashkan";
        identityFile = "~/.ssh/id_learner";
      };
    };
  };
}
