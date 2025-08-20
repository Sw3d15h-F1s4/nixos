# Settings specific to my latpop
{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "laptop";

  myNixOS = {
    bundles.hyprland-desktop.enable = true;
    #bundles.plasma-desktop.enable = true;

    bundles.engineering.enable = true;
    # bundles.productivity.enable = true;

    nvidiagpu.enable = true;
    steam.enable = true;
    matlab.enable = true;

    home-users = {
      sam = {
        userConfig = ../../users/sam/home.nix;
        userSettings = {
          extraGroups = ["networkmanager" "wheel"];
          description = "Sam T";
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

  services.asusd = {
    enable = true;
    enableUserService = true;
  };

  home-manager.users = builtins.mapAttrs (name: user: {...}: {
    imports = [
      ./home.nix
    ];
  })
  (config.myNixOS.home-users);
}
