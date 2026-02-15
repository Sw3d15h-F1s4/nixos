{ config, ... }:
let
  colors = config.myHomeManager.colors;
in
{
  wayland.windowManager.hyprland= {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.variables = ["--all"];

    settings = {
      "$mod" = "SUPER";
      "$fileManager" = "uwsm app -- nautilus";

      exec-once = [
        "uwsm app -- udiskie"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;

        #resize_on_border = true;
        "col.active_border" = "rgba(${colors.green}ff)";
        "col.inactive_border" = "rgba(${colors.bg_green}ff)";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
        blur = {
          enabled = true;
          size = 8;
          passes = 2;
          #xray = true;
        };
      };

      dwindle = {
        force_split = 2;
      };

      animations = {
        enabled = "yes, please :)";
      };

      input = {
        kb_layout = "us";
        kb_variant = "";

        follow_mouse = 1;
      };

      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, E, exec, $fileManager"
        "$mod, C, killactive"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"

        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, l, movewindow, r"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "$mod SHIFT, s, exec, hyprshot -m region -o ~/Pictures/Screenshots"
      ] ++ (
        builtins.concatLists (builtins.genList (i:
          let ws = 1 + i;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            "$mod CTRL_SHIFT, code:1${toString i}, focusworkspaceoncurrentmonitor, ${toString ws}"
          ]
        ) 9));

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      device = [
        {
          name = "wireless-controller-touchpad";
          enabled = 0;
        }
      ];

      misc = {
        disable_hyprland_logo = true;
        background_color = "rgb(${colors.bg_dim})";
        disable_splash_rendering = true;
      };

    };
  };
}
