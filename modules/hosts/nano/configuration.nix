# This is a configurration for the smallest linode instance

{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "nano"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s5.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
  };
  networking.usePredictableInterfaceNames = false;
  # required for ssh?
  networking.interfaces.eth0.useDHCP = true;
  environment.systemPackages = with pkgs; [ inetutils mtr sysstat wget git ];
  users.users.ashkanaleali = {
    isNormalUser = true;
    home = "/home/ashkanaleali";
    description = "Ashkan Aleali";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVtWjC44xpcE/itxQYYi6xaQQjCghsAYcDgwHWGd0Jovh8ksOj2adF1sojzIE70QTysBIqqOZJHK0vvdgO8Qv4EX7FRmWb/GOY1ebAnWGHhBUnnLk68ODa5gK7Xk9A1QbyIt9QYTxHTY/icCIZIM59nVmKkMQKr0gi9a3SXaqOmyLGmHxRMBFurueogqZ3Rsos2hn+JTmQqZO+4O+M3tG3ANkoG4XLPJLSsKluiG+fBQX6q8gMZBpzXM3fLRiwWnh+6JBVDuWTV5n4oPD031SBLVliOslRrTpHKLAO/RUJDnpI3xeL8Du5svR5mcXtQ25ctw4q5LjsNsGQEoe4xtZnFh9OmX+v0jWQUnVFLezoDgfI94qZioUGtuP4IN7AOmxMTzP0FAmDmM+OtvK80Rkdl0NHxLjaLF3Hv+W0GdQ8o3vbQcZtB5FpXLf2sGKXbf6ddsi3ks7E0LZCCEnXrY/lfmb54sr/OWkJxMg9fCj4LwTqm8EaTNaEf9KxE6vPJMgNYZS6DFt5MqUcGCkBaSBvYhydVuMQwRjktZMVib7qe6dmqtF4NRbvSsiNnPXVw7i1HCNEr64Vqm2KRc1mKUhhRrAF8kLmX1FoGi87qqkqTR5BnWnhFZCTeDT5tN2nlq43GqZyvwE+T90pzRfnzVuVykS8RRnhngrA9sjHx7XDbw== ashkanaleali@gmail.com"
    ];
  };
}

