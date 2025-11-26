{ outputs, lib, ... }:
{
  imports = [outputs.homeManagerModules.default];

  programs.git.settings.user.email = "Sw3d15h-F1s4";
  programs.git.settings.user.name  = "samjt36@gmail.com";

  myHomeManager = {
    bundles.general.enable = true;
    bundles.desktopitems.enable = true;

    bundles.hyprland.enable = true;
    #bundles.plasma.enable = true;

    #alacritty.enable = true;
    ghostty.enable = true;
    nixvim.enable = true;
    neovide.enable = true;
    fastfetch.enable = true;
    zellij.enable = true;
    qalculate.enable = true;
    vesktop.enable = true;

    colors.everforest.enable = true;
  };


  home = {
    username = "sam";
    homeDirectory = lib.mkDefault "/home/sam";
    stateVersion = "23.11";

  };
}
