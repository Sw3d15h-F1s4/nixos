{config, mylib, ...}:
let
  colors = config.myHomeManager.colors;

  hex = mylib.colors.hex;
in
{
   programs.alacritty.enable = true;

   programs.alacritty = {
     settings = {
      env.TERM = "xterm-256color";
      font = {
         normal = {
           family = "FiraCode Nerd Font";
           style = "Regular";
         };
         bold = {
           family = "FiraCode Nerd Font";
           style = "Bold";
         };
         size = 12;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;

      window = {
        opacity = if (config.myHomeManager.hyprland.enable) then 0.8 else 1.0;
        blur = true;
      };

      colors = {
        primary = {
          background = hex colors.bg0;
          foreground = hex colors.text;
        };
        normal = {
          black =   hex colors.black;
          red =     hex colors.red;
          green =   hex colors.green;
          yellow =  hex colors.yellow;
          blue =    hex colors.blue;
          magenta = hex colors.purple;
          cyan =    hex colors.cyan;
          white =   hex colors.text;
        };
        bright = {
          black =   hex colors.brblack;
          red =     hex colors.red;
          green =   hex colors.green;
          yellow =  hex colors.yellow;
          blue =    hex colors.blue;
          magenta = hex colors.purple;
          cyan =    hex colors.cyan;
          white =   hex colors.text;
        };
      };
     };
   }; 

  wayland.windowManager.hyprland = {
    settings = {
      "$terminal" = "uwsm app -- alacritty";
    };
  };

  programs.waybar.settings.mainBar = {
    cpu.on-click = "alacritty -e htop";
    memory.on-click = "alacritty -e htop";
  };

}
