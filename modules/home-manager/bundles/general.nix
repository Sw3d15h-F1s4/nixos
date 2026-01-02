{ config, lib, ... }:
{

  programs.home-manager.enable = lib.mkDefault true;

  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}/nixos";
  };

}
