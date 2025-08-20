# For settings specific to desktop
{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "desktop";

  myNixOS = {
    bundles.hyprland-desktop.enable = true;
    #bundles.plasma-desktop.enable = true;

    bundles.engineering.enable = true;
    bundles.productivity.enable = true;

    amdgpu.enable = true;
    steam.enable = true;
    matlab.enable = true;
    #minecraft.enable = true;

    home-users = {
      sam = {
        userConfig = ../../users/sam/home.nix;
        userSettings = {
          extraGroups = ["networkmanager" "wheel" "dialout" "scanner" "lp" "gamemode"];
          description = "Sam T";
        };
      };
    };

  };

  environment.systemPackages = with pkgs; [
    liquidctl
    scrcpy
  ];

  home-manager.users = builtins.mapAttrs (name: user: {...}: {
    imports = [
      ./home.nix
    ];
  })
  (config.myNixOS.home-users);

  system.stateVersion = "23.11";
}
