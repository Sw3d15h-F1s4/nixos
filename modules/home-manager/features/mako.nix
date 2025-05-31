{ mylib, config, ... }:
let
  clib = mylib.colors;
  colors = config.myHomeManager.colors;
in
{
  services.mako = {
    enable = true;

    settings = {
      border-radius = 10;
      default-timeout = 5000;
      background-color = clib.rgba colors.bg0 "80";
      border-color = clib.rgba colors.green "80";
      text-color = clib.rgba colors.text "FF";

      font = "FiraCode Nerd Font";
    };
  };

  wayland.windowManager.hyprland.settings = {
      layerrule = [
        "blur, notifications"
        "ignorezero, notifications"
      ];
  };
}
