{ ... }:
{
  programs.neovide = {
    enable = true;
    settings = {
      # nothing useful here
    };
  };

  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "match:class neovide, opacity 0.8"
    ];
  };

}
