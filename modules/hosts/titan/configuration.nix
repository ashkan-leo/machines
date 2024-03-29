{ config, pkgs, lib, ... }:
let
  nvidia_x11 = config.boot.kernelPackages.nvidia_x11;
  nvidia_gl = nvidia_x11.out;
  nvidia_gl_32 = nvidia_x11.lib32;

in {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../network/tailscale.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "titan"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp36s0f0.useDHCP = true;
  networking.interfaces.enp36s0f1.useDHCP = true;
  networking.interfaces.wlp37s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  environment = {
    # a list of common environment vars (editor, etc.)
    # FIXME this doesn't work using fish shell in Linux
    # comment out and set in the fish module specifically
    # variables = import ../../env/vars.nix;

    # shells managed by nix is listed here
    # you can change to them by running chsh -s /run/current-system/sw/bin/fish
    shells = with pkgs; [ bashInteractive fish zsh ];
  };

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix = {
    settings = {
      max-jobs = 32;
      cores = 32;
    };
    extraOptions = ''
      # add these lines to prevent garbage collection interfering with direnv-nix
      keep-outputs = true
      keep-derivations = true
    '';
  };
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    cudaSupport = true;
  };

  # enable mosh and open associate ports
  programs.mosh.enable = true;

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
  users.users.ashkan = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  users.users.toby = { isNormalUser = true; };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    fish
    zsh
    bashInteractive
    # cudatoolkit
    nvidia_x11
    tmux
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.grafana = {
    enable = true;
    domain = "localhost";
    analytics.reporting.enable = false;
    port = 2538;

    # database = {
    #   type = "postgres";
    #   host = "127.0.0.1:2548";
    #   name = "titan_grafana_db";
    #   user = "root";
    # };
  };
  # enable the GPUs
  services.nginx.enable = true;
  # nginx reverse proxy to access grafana from the outside
  services.nginx.virtualHosts.${config.services.grafana.domain} = {
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString config.services.grafana.port}";
      proxyWebsockets = true;
    };
  };
  services.prometheus = {
    enable = true;
    port = 9001;
  };
  services.prometheus = {
    exporters = {
      node = {
        enable = true;
        enabledCollectors = [ "systemd" ];
        port = 9002;
      };
    };
    scrapeConfigs = [{
      job_name = "titan";
      static_configs = [{
        targets = [
          "127.0.0.1:${toString config.services.prometheus.exporters.node.port}"
        ];
      }];
    }];
  };
  services.xserver = {
    enable = true;
    exportConfiguration = true;
    videoDrivers = [ "nvidia" ];
    updateDbusEnvironment = true;
    displayManager.startx.enable = true;
    deviceSection = ''
      Option         "AllowEmptyInitialConfiguration"
    '';
  };
  hardware.nvidia = {
    nvidiaPersistenced = true;
    # modesetting.enable = true;
    # powerManagement.finegrained = true;
    powerManagement.enable = true;
  };
  boot.extraModulePackages = [ nvidia_x11 ];

  # systemd.services.nvidia-fan-controller = {
  #   script = ''
  #     DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 /run/current-system/sw/bin/nvidia-settings -a [gpu:0]/GPUFanControlState=1
  #     DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 /run/current-system/sw/bin/nvidia-settings -a [gpu:1]/GPUFanControlState=1
  #         '';
  #   wantedBy = [ "multi-user.target" ];
  # };
  # services.xserver.videoDrivers = [ "nvidia" ];
  # FIXME loki doesn't run
  # services.loki = {
  #   enable = true;
  #   configFile = ./loki.yaml;
  # };
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
  system.stateVersion = "21.05"; # Did you read the comment?

}

