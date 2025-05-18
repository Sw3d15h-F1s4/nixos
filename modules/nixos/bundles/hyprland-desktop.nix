{ lib, pkgs, ... }:
{
  myNixOS = {
    bundles.main.enable = true;
    sddm.enable = lib.mkDefault true;

    hyprland.enable = true;

    bundles.default-software.enable = lib.mkDefault true;
    bundles.desktop-software.enable = lib.mkDefault true;

    pipewire.enable = lib.mkDefault true;
    networking.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
  };

  # Default applications with Hyprland
  environment.systemPackages = with pkgs; [
    # Music player
    gapless

    # PDF Viewer
    kdePackages.okular

    # Screenshot
    hyprshot
    hyprpicker

    # Media
    clapper

    # Image viewer
    image-roll

    # Wifi settings
    networkmanagerapplet

    # note taking
    rnote

    nautilus
    file-roller

    pwvucontrol
    helvum
  ];

}
