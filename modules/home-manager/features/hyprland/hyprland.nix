{ ... }:
{
  wayland.windowManager.hyprland= {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.variables = ["--all"];

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "uwsm app -- alacritty";
      "$fileManager" = "uwsm app -- nautilus";
      "$menu" = "uwsm app -- wofi --show drun";

      exec-once = [
        "uwsm app -- udiskie"
      ];

      monitor = [
        "desc:Dell Inc. S2719DGF FRG05V2, 2560x1440@144, auto, 1, vrr, 2"
        "desc:Dell Inc. DELL S2721DS 1N3YTY3, 2560x1440@75, auto, 1"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;

        resize_on_border = true;
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
      };

      animations = {
        enabled = "yes, please :)";
      };

      input = {
        kb_layout = "us";
        kb_variant = "";

        follow_mouse = 0;
      };

      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, R, exec, $menu"
        "$mod, E, exec, $fileManager"
        "$mod, C, killactive"
        "$mod SHIFT, M, exec, loginctl kill-session $XDG_SESSION_ID"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        "$mod, m, exec, hyprlock"

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

        "$mod SHIFT, s, exec, hyprshot -m region"

      ] ++ (
        builtins.concatLists (builtins.genList (i:
          let ws = 1 + i;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 9));

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      env = [
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
        "HYPRCURSOR_SIZE,24"
      ];

      device = [
        {
          name = "wireless-controller-touchpad";
          enabled = 0;
        }
      ];
    };
  };
}
