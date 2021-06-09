{ config, lib, pkgs, ... }:

{

  environment.etc."sysctl.conf" = {
    enable = true;
    text = ''
      kern.maxfiles=10485760
      kern.maxfilesperproc=1048576
    '';
  };

  environment.ect."launchd.conf" = {
    enable = true;
    text = ''
      limit maxfiles 8192 20480
      limit maxproc 1000 2000
    '';
  };
  environment.etc."profile" = {
    enable = true;
    text = ''
      ulimit -n 9096
    '';
  };

  # Increase the maximum number of files and file descriptors
  # FIXME this doesn't have the intended effect.
  # https://superuser.com/a/514049
  # environment = {
  #   etc = {
  #     "sysctl.conf" = {
  #       enable = true;
  #       text = ''
  #         kern.maxfiles=20480
  #       '';
  #     };
  #     "launchd.conf" = {
  #       enable = true;
  #       text = ''
  #         limit maxfiles 8192 20480
  #         limit maxproc 1000 2000
  #       '';
  #     };
  #     "profile" = {
  #       enable = true;
  #       text = ''
  #         ulimit -n 9096
  #       '';
  #     };
  #   };
  # };

  # Enable Touch ID sudo authentication
  # FIXME this can't be done here. doing it manually for now.
  # environment.etc."pam.d/sudo" = {
  #   enable = true;
  #   text = ''
  #     # sudo: auth account password session
  #     # AUTO GRENERATED FILE.
  #     # DO NOT MODIFY BY HAND
  #     auth       sufficient     pam_tid.so
  #     auth       sufficient     pam_smartcard.so
  #     auth       required       pam_opendirectory.so
  #     account    required       pam_permit.so
  #     password   required       pam_deny.so
  #     session    required       pam_permit.so
  #   '';
  # };

}
