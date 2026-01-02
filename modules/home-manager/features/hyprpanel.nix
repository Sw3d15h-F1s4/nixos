{ lib, config, mylib, ... }:
let
  colors = config.myHomeManager.colors;
in
{

  # incompatible!
  myHomeManager.mako.enable = lib.mkForce false;

  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;

    settings = {
      bar = {
        layouts = {
          "*" = {
            left = [
              "dashboard"
              "workspaces"
              "media"
            ];
            middle = [

            ];
            right = [
              "hypridle"
              "clock"
              "volume"
              "network"
              "bluetooth"
              "systray"
              "notifications"
            ];
          };
        };

        launcher = {
          autoDetectIcon = true;
        };

        workspaces = {
          showWsIcons = false;
          showApplicationIcons = false;
          applicationIconOncePerWorkspace = true;
          show_numbered = true;
        };

        network = {
          label = false;
        };

        bluetooth = {
          label = false;
        };

        clock = {
          format = "%I:%M %p";
        };

        media = {
          show_active_only = true;
          show_label = false;
        };

        volume = {
          rightClick = "uwsm app hyprpwcenter";
        };

        customModules = {
          hypridle = {
            label = false;
          };
        };
      };

      menus = {
        volume = {
          raiseMaximumVolume = true;
        };

        clock = {
          weather.enabled = false;
        };

        dashboard = {
          controls.enabled = false;
          stats.enabled = false;

          powermenu = {
            logout = "uwsm stop";
            shutdown = "systemctl poweroff";
            reboot = "systemctl reboot";
          };

          shortcuts = {
            enabled = true;
            left = {
              shortcut1 = {
                icon = "󰈹";
                command = "uwsm app firefox";
                tooltip = "Firefox";
              };
              shortcut2 = {
                icon = "";
                command = "";
                tooltip = "";
              };
              shortcut3 = {
                icon = "";
                command = "uwsm app vesktop";
                tooltip = "Vesktop";
              };
            };

            right = {
              shortcut3 = {
                icon = "";
                command = "";
                tooltip = "";
              };
            };
          };

          directories = {
            enabled = true;

            left = {
              directory3 = {
                command = "bash -c \"xdg-open $HOME/Documents/code\"";
                label = "󰚝 code";
              };
            };
          };
        };
      };

      theme = {

        font = {
          name = "JetBrainsMono Nerd Font";
          label = "JetBrainsMono Nerd Font";
          size = "1.1rem";
        };

        osd = {
          enable = true;
          radius = "20px";

          bar_color = "#${colors.yellow}";
          bar_overflow_color = "#${colors.orange}";
          bar_empty_color = "#${colors.bg_yellow}";
          bar_container = "#${colors.bg0}";
          icon = "#${colors.bg_dim}";
          icon_container = "#${colors.yellow}";
          label = "#${colors.yellow}";
        };

        notification = {
          background = "#${colors.bg2}";
          opacity = 100;
          actions.background = "#${colors.green}";
          actions.text = "#${colors.bg_dim}";
          labelicon = "#${colors.text}";
          label = "#${colors.text}";
          border = "#${colors.bg_green}";
          time = "#${colors.text}";
          close_button.background = "#${colors.red}";
          close_button.label = "#${colors.bg_dim}";
          border_radius = "20px";
        };

        bar = {
          border_radius = "20px";
          outer_spacing = "10px";
          dropdownGap = "40px";
          margin_top = "10px";
          margin_sides = "10px";
          buttons.text = "#${colors.text}";
          transparent = true;

          buttons = {
            style = "default";
            monochrome = false;
            borderSize = "0.1em";
            radius = "20px";
            y_margins = "5px";
            spacing = "5px";
            padding_x = "10px";
            padding_y = "2px";

            dashboard = {
              background = "#${colors.red}";
              icon = "#${colors.bg_dim}";
              border = "#${colors.red}";
            };

            workspaces = {
              background = "#${colors.bg0}";
              occupied = "#${colors.text}";
              active = "#${colors.green}";
              numbered_active_underline_color = "#${colors.bg5}";
              hover = "#${colors.purple}";
              available = "#${colors.blue}";
              border = "#${colors.bg_dim}";
            };

            media = {
              background = "#${colors.cyan}";
              text = "#${colors.bg_dim}";
              icon = "#${colors.bg_dim}";
              border = "#${colors.cyan}";
            };

            volume = {
              background = "#${colors.yellow}";
              border = "#${colors.yellow}";
              text = "#${colors.bg_dim}";
              icon = "#${colors.bg_dim}";
            };

            network = {
              background = "#${colors.green}";
              icon = "#${colors.bg_dim}";
              text = "#${colors.bg_dim}";
              border = "#${colors.green}";
            };

            bluetooth = {
              background = "#${colors.cyan}";
              border = "#${colors.cyan}";
              text = "#${colors.bg_dim}";
              icon = "#${colors.bg_dim}";
            };

            systray = {
              background = "#${colors.bg0}";
            };

            clock = {
              background = "#${colors.orange}";
              border = "#${colors.orange}";
              text = "#${colors.bg_dim}";
              icon = "#${colors.bg_dim}";
            };

            notifications = {
              background = "#${colors.blue}";
              border = "#${colors.blue}";
              icon = "#${colors.bg_dim}";
              total = "#${colors.bg_dim}";
            };

            modules = {
              hypridle = {
                text = "#${colors.bg_dim}";
                icon = "#${colors.bg_dim}";
                background = "#${colors.red}";
                border = "#${colors.red}";
              };
            };
          };

          menus = {
            opacity = 100;
            card_radius = "20px";
            monochrome = false;
            enableShadow = false;
            background = "#${colors.bg_dim}";
            text = "#${colors.text}";
            dimtext = "#${colors.text}";
            feinttext = "#${colors.darkgray}";
            label = "#${colors.green}";

            progressbar = {
              radius = "20px";
              foreground = "#${colors.green}";
              background = "#${colors.bg_green}";
            };

            slider = {
              slider_radius = "20px";
              progress_radius = "20px";
              primary = "#${colors.green}";
              background = "#${colors.bg_dim}";
              backgroundhover = "#${colors.bg_green}";
              puck = "#${colors.green}";
            };

            scroller = {
              radius = "20px";
            };

            border = {
              radius = "20px";
              color = "#${colors.bg_dim}";
            };

            popover = {
              radius = "20px";
              text = "#${colors.text}";
              background = "#${colors.bg_dim}";
            };

            listitems = {
              active = "#${colors.green}";
              passive = "#${colors.lightgray}";
            };

            icons = {
              active = "#${colors.green}";
              passive = "#${colors.lightgray}";
            };

            switch = {
              radius = "20px";
              slider_radius = "20px";
              enabled = "#${colors.green}";
              disabled = "#${colors.bg_green}";
              puck = "#${colors.green}";
            };

            check_radio_button = {
              background = "#${colors.bg_green}";
              active = "#${colors.green}";
            };

            buttons = {
              radius = "20px";
              default = "#${colors.green}";
              active = "#${colors.orange}";
              disabled = "#${colors.darkgray}";
              text = "#${colors.bg_dim}";
            };

            iconbuttons = {
              passive = "#${colors.text}";
              active = "#${colors.green}";
            };

            dropdownmenu = {
              background = "#${colors.bg_dim}";
              text = "#${colors.text}";
              divider = "#${colors.lightgray}";
            };

            tooltip = {
              radius = "20px";
              background = "#${colors.bg_dim}";
              text = "#${colors.text}";
            };

            menu = {

              network = {
                text = "#${colors.text}";
                card.color = "#${colors.bg0}";
                background.color = "#${colors.bg_dim}";
              };

              bluetooth = {
                text = "#${colors.text}";
                background.color = "#${colors.bg_dim}";
                card.color = "#${colors.bg0}";
                border.color = "#${colors.bg_blue}";
                label.color = "#${colors.blue}";
                status = "#${colors.text}";
                listitems.active = "#${colors.cyan}";
                listitems.passive = "#${colors.lightgray}";
                icons.active = "#${colors.cyan}";
                icons.passive = "#${colors.lightgray}";
                iconbutton.active = "#${colors.cyan}";
                iconbutton.passive = "#${colors.lightgray}";
                scroller.color = "#${colors.blue}";
                switch.enabled = "#${colors.blue}";
                switch.disabled = "#${colors.bg_blue}";
                switch.puck = "#${colors.bg_dim}";
                switch_divider = "#${colors.darkgray}";
              };

              clock = {
                text = "#${colors.text}";
                card.color = "#${colors.bg0}";
                background.color = "#${colors.bg_dim}";
                border.color = "#${colors.bg_red}";
                time.time = "#${colors.orange}";
                time.timeperiod = "#${colors.orange}";
                calendar.yearmonth = "#${colors.orange}";
                calendar.paginator = "#${colors.yellow}";
                calendar.weekdays = "#${colors.red}";
                calendar.currentday = "#${colors.green}";
                calendar.days = "#${colors.text}";
                calendar.contextdays = "#${colors.gray}";
              };

              dashboard = {
                card.color = "#${colors.bg0}";
                background.color = "#${colors.bg_dim}";
                profile.name = "#${colors.green}";
                profile.radius = "20px";

                powermenu = {
                  shutdown = "#${colors.red}";
                  restart = "#${colors.orange}";
                  logout = "#${colors.green}";
                  sleep = "#${colors.blue}";

                  confirmation = {
                    card = "#${colors.bg0}";
                    background = "#${colors.bg_dim}";
                    border = "#${colors.bg_purple}";
                    label = "#${colors.red}";
                    body = "#${colors.text}";
                    confirm = "#${colors.green}";
                    deny = "#${colors.red}";
                  };
                };

                shortcuts = {
                  background = "#${colors.cyan}";
                  text = "#${colors.bg_dim}";
                  recording = "#${colors.red}";
                };

                directories = {
                  left = {
                    top.color = "#${colors.red}";
                    middle.color = "#${colors.orange}";
                    bottom.color = "#${colors.yellow}";
                  };
                  right = {
                    top.color = "#${colors.green}";
                    middle.color = "#${colors.cyan}";
                    bottom.color = "#${colors.blue}";
                  };
                };
              };

              media = {
                song = "#${colors.cyan}";
                artist = "#${colors.green}";
                album = "#${colors.purple}";
                timestamp = "#${colors.text}";
                background.color = "#${colors.bg_dim}";
                border.color = "#${colors.bg_green}";
                card.color = "#${colors.bg0}";
                card.tint = 85;
                buttons.inactive = "#${colors.darkgray}";
                buttons.enabled = "#${colors.orange}";
                buttons.background = "#${colors.cyan}";
                buttons.text = "#${colors.bg_dim}";
                slider.primary = "#${colors.cyan}";
                slider.background = "#${colors.bg0}";
                slider.backgroundhover = "#${colors.bg_green}";
                slider.puck = "#${colors.cyan}";
              };

              network = {
                label.color = "#${colors.green}";
                border.color = "#${colors.bg_green}";
                status.color = "#${colors.lightgray}";
                switch.enabled = "#${colors.green}";
                switch.disabled = "#${colors.bg_green}";
                switch.puck = "#${colors.bg_dim}";
                listitems.active = "#${colors.green}";
                listitems.passive = "#${colors.text}";
                icons.active = "#${colors.green}";
                icons.passive = "#${colors.lightgray}";
                scroller.color = "#${colors.green}";
                iconbuttons.active = "#${colors.green}";
                iconbuttons.passive = "#${colors.lightgray}";
              };

              notifications = {
                label = "#${colors.blue}";
                card = "#${colors.bg0}";
                background = "#${colors.bg_dim}";
                no_notifications_label = "#${colors.bg4}";
                border = "#${colors.bg_blue}";
                switch_divider = "#${colors.lightgray}";
                clear = "#${colors.red}";
                switch.enabled = "#${colors.blue}";
                switch.disabled = "#${colors.bg_blue}";
                switch.puck = "#${colors.bg_dim}";
                scrollbar.color = "#${colors.blue}";
                pager.background = "#${colors.bg4}";
                pager.button = "#${colors.blue}";
                pager.label = "#${colors.text}";
              };

              systray = {
                dropdownmenu.background = "#${colors.bg_dim}";
                dropdownmenu.text = "#${colors.text}";
                dropdownmenu.divider = "#${colors.darkgray}";
              };

              volume = {
                label.color = "#${colors.yellow}";
                text = "#${colors.text}";
                card.color = "#${colors.bg0}";
                background.color = "#${colors.bg_dim}";
                border.color = "#${colors.bg_yellow}";
                listitems.active = "#${colors.yellow}";
                listitems.passive = "#${colors.text}";
                iconbutton.active = "#${colors.yellow}";
                iconbutton.passive = "#${colors.text}";
                audio_slider.primary = "#${colors.yellow}";
                audio_slider.background = "#${colors.bg_dim}";
                audio_slider.backgroundhover = "#${colors.bg_yellow}";
                audio_slider.puck = "#${colors.yellow}";
                input_slider.primary = "#${colors.yellow}";
                input_slider.background = "#${colors.bg_dim}";
                input_slider.backgroundhover = "#${colors.bg_yellow}";
                input_slider.puck = "#${colors.yellow}";
              };
            };
          };
        };
      };
    };
  };

}
