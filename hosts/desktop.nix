# For settings specific to sam-desktop
{ config, pkgs, lib, modulesPath, ...}:

{
  imports = [
    ./common
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  networking.hostName = "desktop";

  services.xserver.videoDrivers = [ "amdgpu" ];


  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "nvme"];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/SSD";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1D8E-699F";
      fsType = "vfat";
    };
  fileSystems."/mnt/hdd" = {
      device = "/dev/disk/by-label/HDD";
      fsType = "ext4";
      options = ["rw" "users" "exec"];
    };
  fileSystems."/mnt/nvme" = {
      device = "/dev/disk/by-label/nvme";
      fsType = "ext4";
      options = ["rw" "users" "exec"];
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
