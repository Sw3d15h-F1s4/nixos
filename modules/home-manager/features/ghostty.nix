{ config, ... }:
let
  colors = config.myHomeManager.colors;
in
{
  programs.ghostty.enable = true;

  programs.ghostty = {
    enableFishIntegration = true;
    settings = {
      theme = "everforest-dark";
      font-family = "FiraCode Nerd Font";
      font-synthetic-style = false;
      font-size = 12;
      background-opacity = 0.8;
      unfocused-split-opacity = 0.6;
      background-blur = true;
      cursor-style = "block";
      cursor-style-blink = false;
      link-url = true;
    };
    themes = {
      everforest-dark = {
        background = "#${colors.bg_dim}";
        cursor-color = "#${colors.orange}";
        cursor-text = "#${colors.bg_purple}";
        foreground = "#${colors.text}";
        palette = [
          "0=#${colors.darkgray}"
          "1=#${colors.red}"
          "2=#${colors.green}"
          "3=#${colors.yellow}"
          "4=#${colors.blue}"
          "5=#${colors.purple}"
          "6=#${colors.cyan}"
          "7=#${colors.white}"
          "8=#${colors.gray}"
          "9=#${colors.br_red}"
          "10=#${colors.br_green}"
          "11=#${colors.br_yellow}"
          "12=#${colors.br_blue}"
          "13=#${colors.br_purple}"
          "14=#${colors.br_cyan}"
          "15=#${colors.br_white}"
        ];
        selection-background = "#${colors.bg_purple}";
        selection-foreground = "#${colors.text}";
      };
    };
  };

  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "uwsm app -- ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
      ];
      "$terminal" = "uwsm app -- ghostty --gtk-single-instance=true";
    };
  };

  programs.waybar.settings.mainBar = {
    cpu.on-click = "ghostty -e htop";
    memory.on-click = "ghostty -e htop";
  };
}
