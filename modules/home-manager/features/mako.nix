{ ... }:
{
  services.mako = {
    enable = true;

    borderRadius = 10;
    defaultTimeout = 5000;
    backgroundColor = "#1E232680";
    borderColor = "#A7C08080";
    textColor = "#D3C6AAFF";

    font = "FiraCode Nerd Font";
  };

  wayland.windowManager.hyprland.settings = {
      layerrule = [
        "blur, notifications"
        "ignorezero, notifications"
      ];
  };
}
