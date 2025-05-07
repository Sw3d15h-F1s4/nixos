{ ... }:
{
  services.mako = {
    enable = true;

    settings = {
      border-radius = 10;
      default-timeout = 5000;
      background-color = "#1E232680";
      border-color = "#A7C08080";
      text-color = "#D3C6AAFF";

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
