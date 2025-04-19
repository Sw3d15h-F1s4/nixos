{ lib, ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "desc:Dell Inc. S2719DGF FRG05V2, 2560x1440@144, auto, 1, vrr, 2"
      "desc:Dell Inc. DELL S2721DS 1N3YTY3, 2560x1440@75, auto, 1"
    ];
  };

  myHomeManager.hyprlock.default-monitor = "DP-1";
}
