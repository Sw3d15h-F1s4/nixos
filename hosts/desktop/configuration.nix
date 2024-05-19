# For settings specific to desktop
{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "desktop";

  myNixOS = {
    bundles.plasma-desktop.enable = true;
    bundles.users.enable = true;

    amdgpu.enable = true;
    nvidiagpu.enable = false;
    grub.enable = true;
    steam.enable = true;
    nix.enable = true;
    locale.enable = true;
    aagl.enable = true;

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
}