{ config, pkgs, ... }:

{

  users.users.sam = {
    isNormalUser = true;
    description = "Sam T";
    extraGroups = ["networkmanager" "wheel"];

    shell = pkgs.fish;
  };

}
