{ mylib, config, ... }:
let
  colors = config.myHomeManager.colors;
in
{
  programs.waybar = {
    enable = true;

    style = ''
      @define-color background #${colors.bg0};
      @define-color background-light #${colors.bg1};
      @define-color foreground #${colors.text};
      @define-color black #${colors.bg_dim};
      @define-color red #${colors.red};
      @define-color green #${colors.green};
      @define-color yellow #${colors.yellow};
      @define-color blue #${colors.blue};
      @define-color magenta #${colors.purple};
      @define-color cyan #${colors.cyan};
      @define-color white #${colors.text};
      @define-color orange #${colors.orange};
      '' + builtins.readFile ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-top = 5;
        spacing = 5;

        modules-left = [
          "user"
          "hyprland/workspaces"
          "hyprland/submap"
        ];

        modules-center = [
          "hyprland/window"
        ];

        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "disk"
          "clock"
          "tray"
        ];


        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          format = "{name}";
        };

        "hyprland/submap" = {
          format = "<span style=\\\"italic\\\">{}</span>";
        };

        "hyprland/window" =- {
          format = "{title}";
          max-length = 30;
          icon = true;
          icon-size = 18;
        };


        tray = {
          icon-size = 18;
          spacing = 5;
        };

        clock = {
          format = "󰥔 {:%I:%M p}";
          format-alt = "󰃮 {:%Y-%m-%d}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-right-click = "mode";
            format = {
              months = "<span color='#d3c6aa'><b>{}</b></span>";
              days = "<span color='#e67e80'>{}</span>";
              weeks = "<span color='#a7c080'><b>W{}</b></span>";
              weekdays = "<span color='#7fbbb3'><b>{}</b></span>";
              today = "<span color='#dbbc7f'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-right-click = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        cpu = {
          format = " {usage:02}%";
          tooltip = true;
          interval = 1;
          # use current terminal to $term -e htop
        };

        memory = {
          format = " {percentage:02}%";
          interval = 1;
          # use current terminal to $term -e htop
        };

        network = {
          format-wifi = "󰖩 {essid} ({signalStrength:02}%)";
          format-ethernet = "󰈀 {ifname}";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰖪 Disconnected";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format = "{ifname}: {ipaddr}";
        };

        pulseaudio = {
          format = "{icon} {volume:02}%";
          format-bluetooth = "󰂰 {volume:02}%";
          format-bluetooth-muted = "󰂲 {icon}";
          format-muted = "󰝟";
          format-icons = {
              headphone = "󰋋";
              hands-free = "󰥰";
              headset = "󰋎";
              phone = "󰏲";
              portable = "󰄝";
              car = "󰄋";
              default = ["󰕿" "󰖀" "󰕾"];
          };
          on-click = "pwvucontrol";
        };

        disk = {
            interval = 30;
            format = "󰋊 {percentage_used:02}%";
            path = "/";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        user = {
          interval = 60;
          format = "{user} {work_H}:{work_M}";
          icon = false;
          open-on-click = false;
        };

      };
    };

    systemd.enable = true;
  };
}
