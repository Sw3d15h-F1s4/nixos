{ pkgs, config, mylib, lib, ... }:
let
  colors = config.myHomeManager.colors;
  clib = mylib.colors;

  powermenu-script = pkgs.writeShellApplication {
    name = "powermenu.sh";
    runtimeInputs = [ pkgs.rofi-wayland ];
    text = builtins.readFile ./powermenu/powermenu.sh;
  };
in
{
  # the home manager module is kind of trash tbh

  home.packages = [ pkgs.rofi-wayland powermenu-script ];

  home.file."${config.xdg.configHome}/rofi/config.rasi".source = ./config.rasi;
  home.file."${config.xdg.configHome}/rofi/launcher/style.rasi".source = ./launcher/style.rasi;
  home.file."${config.xdg.configHome}/rofi/launcher/background.png".source = ./launcher/background.png;
  home.file."${config.xdg.configHome}/rofi/powermenu/style.rasi".source = ./powermenu/style.rasi;
  home.file."${config.xdg.configHome}/rofi/powermenu/confirm.rasi".source = ./powermenu/confirm.rasi;

  home.file."${config.xdg.configHome}/rofi/colors.rasi".text = ''
    /*****----- Global Properties -----*****/
    * {
      font: "FiraCode Nerd Font 12";
      background:     ${clib.rgba colors.bg_dim "CC"};
      background-alt: ${clib.rgba colors.bg0    "FF"};
      foreground:     ${clib.rgba colors.text   "FF"};
      selected:       ${clib.rgba colors.blue   "FF"};
      active:         ${clib.rgba colors.green  "FF"};
      urgent:         ${clib.rgba colors.red    "FF"};
      foreground-alt: ${clib.rgba colors.bg_dim "FF"};
    }
    '';


  wayland.windowManager.hyprland = {
    settings = {
      "$menu" = "rofi -show drun -run-command \"uwsm app -- {cmd}\"";
      bind = [
        "$mod, R, exec, $menu"
        "$mod SHIFT, M, exec, ${lib.getExe powermenu-script}"
      ];
      layerrule = [
        "blur, rofi"
        "ignorezero, rofi"
      ];
    };
  };
}
