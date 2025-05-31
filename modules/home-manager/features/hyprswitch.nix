{ mylib, config, ... }:
let
  clib = mylib.colors;
  colors = config.myHomeManager.colors;
in
{
  xdg.configFile.hyprswitch = {
    enable = true;
    target = "./hyprswitch/style.css";
    text = ''
      * {
          color: ${clib.hex colors.text};
          border: unset;
          font-family: "FiraCode Nerd Font";
      }

      :root {
        --border-size: 3px;
        --border-radius: 20px;
      }

      .monitor {
          background-color: transparent;
      }

      .index {
          background: transparent;
          border-radius: var(--border-radius);
      }

      .workspace {
          background: ${clib.hex2cssa (colors.bg_dim + "C0")};
          border: var(--border-size) solid transparent;
      }

      .workspace_special {
      }

      .workspace_active {
          border: var(--border-size) solid ${clib.hex colors.bg_green};
      }
      .workspace:hover {
          border: var(--border-size) solid ${clib.hex colors.bg_green};
      }

      .client-image {
          background: ${clib.rgba colors.bg0 "77"};
          border-radius: 20px;
      }

      .client {
          background: transparent;
          padding: 5px;
      }

      .client_active {
          background: ${clib.rgba colors.blue "CC"};
      }

      .client:hover {
          background: ${clib.rgba colors.green "CC"};
      }
      '';
  };

  # I could probably avoid using a config file and just passing in ${./style.css}.
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "uwsm app -- hyprswitch init --custom-css ~/.config/hyprswitch/style.css"
      ];

      bind = [
        "alt, tab, exec, hyprswitch gui --mod-key alt --key tab --close mod-key-release --reverse-key=mod=shift"
        "alt SHIFT, tab, exec, hyprswitch gui --mod-key alt --key tab --close mod-key-release --reverse-key=mod=shift"
      ];

      layerrule = [
        "ignorezero, hyprswitch"
        "blur, hyprswitch"
      ];
    };
  };
}
