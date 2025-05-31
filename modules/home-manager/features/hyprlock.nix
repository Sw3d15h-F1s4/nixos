{ config, lib, mylib, ... }:
let
  cfg = config.myHomeManager.hyprlock;
  clib = mylib.colors;
  colors = config.myHomeManager.colors;
in
{
  options.myHomeManager.hyprlock = {
    default-monitor = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = ''
        What monitor Hyprlock should consider primary
      '';
    };

  };
  programs.hyprlock = {
    enable = true;
    package = null;
    settings = {
      background = {
        monitor = "";
        path = "screenshot";
        blur_passes = 2;
        contrast = 1;
        brightness = 0.5;
        vibrancy = 0.2;
        vibracny_darkness = 0.2;
      };

      input-field = {
        monitor = cfg.default-monitor;
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.35;
        dots_center = true;
        outer_color = "rgba(0,0,0,0)";
        inner_color = clib.hex2cssa (colors.bg5 + "CC");
        font_color = clib.hex2css colors.blue;
        fade_on_empty = false;
        rounding = -1;
        check_color = clib.hex2css colors.orange;
        fail_color = clib.hex2css colors.red;
        placeholder_text = "<i><span foreground=\"##293136\">Password...</span></i>";
        hide_input = false;
        position = "0, -200";
        halign = "center";
        valign = "center";
      };

      label = [
        {
          monitor = cfg.default-monitor;
          text = "cmd[update:1000] echo \"\$(date +\"%A, %B %d\")\"";
          color = clib.hex2css colors.text;
          font_size = 22;
          position = "0,300";
          halign = "center";
          valign = "center";
        }
        {
          monitor = cfg.default-monitor;
          text = "cmd[update:1000] echo \"\$(date +\"%-I:%M\")\"";
          color = clib.hex2css colors.text;
          font_size = 95;
          position = "0,200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = cfg.default-monitor;
          text = "cmd[update:1000] echo \"\$(whoami)\"";
          color = clib.hex2css colors.text;
          font_size = 14;
          position = "0,-10";
          halign = "center";
          valign = "top";
        }
      ];

      image = [
        {
          monitor = cfg.default-monitor;
          path = "${../../../users/sam/profile.png}";
          size = 75;
          border_size = 2;
          border_color = "transparent";
          rounding = -1;
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };

  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, m, exec, hyprlock"
    ];
  };
}
