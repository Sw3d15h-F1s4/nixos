{ pkgs, ... }:
{
  
  # Mostly disabled since I never use any of it.

  # environment.systemPackages = with pkgs; [
  #   # "chatmix" Steelseries Arctis 7 Nova headset
  #   headsetcontrol # doesnt really work
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
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="2202", MODE="0666"

    ##### Keychron Devices #####
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="d030", TAG+="uaccess", MODE="0660", GROUP="users", TAG+="udev-acl"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0a80", TAG+="uaccess", MODE="0660", GROUP="users", TAG+="udev-acl"

    ##### 8BitDo Controller #####
    # 8BitDo Pro 2; Bluetooth; USB
    SUBSYSTEM=="input", ATTRS{name}=="8BitDo Pro 2", ENV{ID_INPUT_JOYSTICK}="1", TAG+="uaccess"
    SUBSYSTEM=="input", ATTR{id/vendor}=="2dc8", ATTR{id/product}=="6006", ENV{ID_INPUT_JOYSTICK}="1", TAG+="uaccess"
    SUBSYSTEM=="input", ATTR{id/vendor}=="2dc8", ATTR{id/product}=="6003", ENV{ID_INPUT_JOYSTICK}="1", TAG+="uaccess"
    # 8BitDo Pro 2 Wired; USB
    # X-mode uses the 8BitDo Generic Device rule
    # B-Mode
    SUBSYSTEM=="usb", ATTR{idProduct}=="3010", ATTR{idVendor}=="2dc8", ENV{ID_INPUT_JOYSTICK}="1", TAG+="uaccess"
    SUBSYSTEMS=="input", ATTRS{id/product}=="3010", ATTRS{id/vendor}=="2dc8", ENV{ID_INPUT_JOYSTICK}="1", TAG+="uaccess"

  '';

  # enable openrgb for Apex 7
  # services.hardware.openrgb = {
  #   enable = true;
  #   package = pkgs.openrgb-with-all-plugins;
  # };

}
