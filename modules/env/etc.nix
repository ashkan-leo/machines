{ config, lib, pkgs, ... }:

{

  # Increase the maximum number of files and file descriptors
  # FIXME this doesn't have the intended effect.
  environment.etc."sysctl.conf" = {
    enable = true;
    text = ''
      kern.maxfiles=10485760
      kern.maxfilesperproc=1048576
    '';
  };

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
