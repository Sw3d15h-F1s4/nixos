{ ... }:
{
  xdg.configFile.hyprswitch = {
    enable = true;
    source = ./style.css;
    target = "./hyprswitch/style.css";
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
