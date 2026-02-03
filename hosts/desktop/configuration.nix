# For settings specific to desktop
{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "desktop";

  myNixOS = {
    bundles.hyprland-desktop.enable = true;

    bundles.engineering.enable = true;
    bundles.productivity.enable = true;

    amdgpu.enable = true;
    steam.enable = true;
    #minecraft.enable = true;

    home-users = {
      sam = {
        userConfig = ../../users/sam/home.nix;
        userSettings = {
          extraGroups = ["networkmanager" "wheel" "dialout" "scanner" "lp" "gamemode" "i2c"];
          description = "Sam T";
        };
      };
    };

  };

  environment.systemPackages = with pkgs; [
    liquidctl
    scrcpy
  ];

  hardware.i2c = {
    enable = true;
  };

  home-manager.users = builtins.mapAttrs (name: user: {...}: {
    imports = [
      ./home.nix
    ];
  })
  (config.myNixOS.home-users);

  boot = {
    # enable NTSYNC
    kernelPackages = pkgs.linuxKernel.packageAliases.linux_latest;
    kernelModules = [ "ntsync" ];
  };

  system.stateVersion = "23.11";
}
