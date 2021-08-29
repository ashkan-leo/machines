{ config, lib, pkgs, ... }:

with lib; {
  programs.ssh = {
    forwardAgent = true;
    enable = true;
    matchBlocks = {
      "learner" = {
        hostname = "192.168.1.101";
        user = "ashkan";
        identityFile = "~/.ssh/id_learner";
      };
    };
  };
}
