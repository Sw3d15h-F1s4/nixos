{ config, pkgs, lib, ...  }:

{
  imports = [
    ./common
  ];

  networking.hostName = "sam-laptop";

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
          enable = true;
          enableOffloadCmd = true;
      };
    };
  };

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/b88b16f7-fb9b-4ee6-8473-fbb594e71919";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/E01A/95CF";
      fsType = "vfat";
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
