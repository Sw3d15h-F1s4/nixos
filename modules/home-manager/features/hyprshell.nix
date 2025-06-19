{ mylib, config, lib, pkgs, ... }:
let
  clib = mylib.colors;
  colors = config.myHomeManager.colors;
in
{
  xdg.configFile."hyprshell/styles.css" = {
    enable = true;
    text = ''
      :root {
        --bg-color: ${clib.rgba colors.bg_dim "E5"}
        --bg-color-hover: ${clib.rgba colors.bg0 "FF"}

        --border-radius: 20px;
        --border-size: 3px;
        --border-style: solid;

        --text-color: #${colors.text};
        --window-padding: 2px;
        font-family: "FiraCode Nerd Font";
      }

      * {
          border: unset;
      }

      .monitor {
          background-color: transparent;
      }

      .workspace {
          background: ${clib.hex2cssa (colors.bg_dim + "C0")};
          border-radius: 20px;
          border: var(--border-size) solid transparent;
      }

      .workspace.active {
          border: var(--border-size) solid ${clib.hex colors.bg_green};
      }
      .workspace:hover {
          border: var(--border-size) solid ${clib.hex colors.bg_green};
      }

      .client-image {
      }

      .client {
          padding: 5px;
          border-radius: 20px;
          border: var(--border-size) solid transparent;
      }

      .client.active {
          border: var(--border-size) solid ${clib.rgba colors.green "CC"};
      }

      .client:hover {
          border: var(--border-size) solid ${clib.rgba colors.green "CC"};
      }
      '';
  };

  xdg.configFile."hyprshell/config.json" = {
    enable = true;
    text = builtins.toJSON ({
      layerrules = true;
      kill_bind = "ctrl+shift+alt, h";
      windows = {
        scale = 8.5; # between 0 and 15
        workspaces_per_row = 5;
        strip_html_from_workspace_title = true;
        overview = {
          open = {
            key = "tab";
            modifier = "alt";
          };
          navigate = {
            forward = "tab";
            reverse = {
              mod = "shift";
            };
          };
          other = {
            hide_filtered = false;
          };
        };
      };
    });
  };

  systemd.user.services.hyprshell = {
    Unit = {
      Description = "Starts Hyprshell daemon";
      After = [ config.wayland.systemd.target ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${lib.getExe pkgs.hyprshell} run"; # add args here after run
      Restart = "on-failure";
    };
    Install.WantedBy = [ config.wayland.systemd.target ];
  };

}
