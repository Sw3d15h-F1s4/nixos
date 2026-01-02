{ pkgs, lib, ...}:
{

  services.xserver = {
    # enable = lib.mkDefault true;

    xkb = {
      layout = lib.mkDefault "us";
      variant = lib.mkDefault "";
    };
  };

  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    pciutils
    usbutils
  ];

  services.displayManager.sddm.wayland.enable = lib.mkDefault true;

}
