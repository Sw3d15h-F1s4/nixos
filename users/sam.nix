{ config, pkgs, ... }:

{
  imports = [
#    ./configs/sam
  ];

  home.username = "sam";
  home.homeDirectory = "/home/sam";

  home.packages = with pkgs; [
    vscode
    fastfetch
    lf
    discord
    prismlauncher
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 10;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
