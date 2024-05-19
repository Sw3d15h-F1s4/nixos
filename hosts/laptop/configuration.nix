{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "laptop";

  myNixOS = {
    bundles.plasma-desktop.enable = true;
    bundles.users.enable = true;

    grub.enable = true;
    steam.enable = true;
    nix.enable = true;
    locale.enable = true;
    nvidiagpu.enable = true;
    amdgpu.enable = false;

    home-users = {
      sam = {
        userConfig = ../../users/sam/home.nix;
        userSettings = {
          extraGroups = ["networkmanager" "wheel"];
        };
      };
    };
  };

  system.stateVersion = "23.11";

  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
  };
}