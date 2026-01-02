{ lib, ... }:
{

  networking.firewall = {
    enable = lib.mkDefault true;
    allowedUDPPorts = [ 25565 ];
    allowedTCPPorts = [ 25565 ];
  };

}


