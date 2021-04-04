{ config, lib, pkgs, ... }:

with lib; {
  programs.ssh = {
    forwardAgent = true;
    enable = true;
    matchBlocks = {
      "linode.nano" = {
        hostname = "172.104.197.220";
        user = "ashkanaleali";
        identityFile = "~/.ssh/id_rsa";
      };
      "toby" = {
        hostname = "192.168.1.101";
        user = "ashkan";
        identityFile = "~/.ssh/id_used_for_tshearman_machines";
      };
    };
  };
}
