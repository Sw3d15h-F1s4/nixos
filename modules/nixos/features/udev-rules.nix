{ pkgs, ... }:
{
  
  # Mostly disabled since I never use any of it.

  # environment.systemPackages = with pkgs; [
  #   # Manages for Steelseries Arctis 7 Nova headset
  #   headsetcontrol
  #   # Manages Steelseries Prime Wireless mouse
  #   rivalcfg
  # ];

  services.udev.extraRules = ''

    ##### Steelseries Devices #####

    # SteelSeries Prime Wireless (wired mode)
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1842", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1842", MODE="0666"

    # SteelSeries Prime Wireless (2.4 GHz wireless mode)
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1840", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1840", MODE="0666"

    # SteelSeries Arctis Nova 7
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="2202", TAG+="uaccess"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="2206", TAG+="uaccess"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="220a", TAG+="uaccess"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="223a", TAG+="uaccess"

    # SteelSeries Arctis (7/Pro)
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1260", TAG+="uaccess"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="12ad", TAG+="uaccess"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1252", TAG+="uaccess"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1280", TAG+="uaccess"


    ##### Keychron Devices #####
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="d030", TAG+="uaccess", MODE="0660", GROUP="users", TAG+="udev-acl"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0a80", TAG+="uaccess", MODE="0660", GROUP="users", TAG+="udev-acl"

  '';

  # enable openrgb for Apex 7
  # services.hardware.openrgb = {
  #   enable = true;
  #   package = pkgs.openrgb-with-all-plugins;
  # };

}
