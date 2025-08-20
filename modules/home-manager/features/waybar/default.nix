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
        height = 30;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/submap"
        ];
        modules-center = [
        ];
        modules-right = [
          "idle_inhibitor"
          "clock"
          "pulseaudio"
          "backlight"
          "network"
          "cpu"
          "memory"
          "temperature"
          "disk"
          "tray"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          format = "{name}";
          format-icons = {
            "1" = "󰖟";
            "2" = "";
            "3" = "";
            "4" = "󰭹";
            "5" = "󰕧";
            "6" = "";
            "7" = "";
            "8" = "󰣇";
            "9" = "";
            "10" = "";
          };
          persistent_workspaces = {
            "1"= [];
            "2"= [];
            "3"= [];
            "4"= [];
            "5"= [];
          };
        };
        "hyprland/submap" = {
          format = "<span style=\\\"italic\\\">{}</span>";
        };
        tray = {
          icon-size = 18;
          spacing = 10;
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
          format = " {usage}%";
          tooltip = true;
          interval = 1;
          # use current terminal to $term -e htop
        };
        memory = {
          format = " {}%";
          interval = 1;
          # use current terminal to $term -e htop
        };
        network = {
          format-wifi = "󰖩 {essid} ({signalStrength}%)";
          format-ethernet = "󰈀 {ifname}";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰖪 Disconnected";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format = "{ifname}: {ipaddr}";
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "󰂰 {volume}%";
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
        backlight = {
            format = "{icon} {percent}%";
            format-icons = ["󰃞" "󰃟" "󰃠"];
            on-scroll-up = "brightnessctl set +5%";
            on-scroll-down = "brightnessctl set 5%-";
        };
        temperature = {
            critical-threshold = 80;
            format = "{icon} {temperatureC}°C";
            format-icons = ["󱃃" "󰔏" "󱃂"];
        };
        disk = {
            interval = 30;
            format = "󰋊 {percentage_used}%";
            path = "/";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          timeout = "45";
        };
      };
    };

    systemd.enable = true;
  };
}
