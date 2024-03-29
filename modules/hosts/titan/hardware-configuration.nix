# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/047e4509-0921-40cc-8a66-b07619cf47f2";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0A61-B79A";
      fsType = "vfat";
    };

  fileSystems."/pond" =
    { device = "/dev/disk/by-uuid/5b7f8451-2bf4-4b9f-b238-c1a9f309adfd";
      fsType = "ext4";
    };

  fileSystems."/backup" =
    { device = "/dev/disk/by-uuid/3e230b17-b48f-4671-94b6-481b06e07f9f";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/0106e9eb-7d00-4106-9fef-b05633951adb"; }
    ];

}
