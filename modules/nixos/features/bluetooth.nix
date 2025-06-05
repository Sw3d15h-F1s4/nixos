{ config, pkgs, ... }:
{

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    input = {
      General = {
        UserspaceHID = true;
        ClassicBondedOnly = false;
        LEAutoSecurity = false;
      };
    };
  };

  services.blueman.enable = true;

}
