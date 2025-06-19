{ lib, pkgs, ... }:
{
  # The NixOS side of enabling hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  services.hypridle.enable = true;

  programs.hyprlock = {
    enable = true;
  };

  security = {
    polkit.enable = lib.mkDefault true;
    pam.services.hyprlock = {};
  };

  systemd.user.services.hyprpolkitagent = {
    description = "Hyprland Polkit Authentication Agent";
    partOf = ["graphical-session.target"];
    wantedBy = ["graphical-session.target"];
    after = ["graphical-session.target"];
    unitConfig = {
      ConditionEnvironment = "WAYLAND_DISPLAY";
    };
    serviceConfig = {
      ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
      Slice = "session.slice";
      TimeoutStopSec="5sec";
      Restart="on-failure";
    };
  };

  services.xserver = {
    xkb = {
      layout = lib.mkDefault "us";
      variant = lib.mkDefault "";
    };
  };

  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    hyprpolkitagent #TODO: likely move to separate feature
    brightnessctl
    udiskie
    qt6ct
    hyprshell #TODO: likely move to separate feature

    kdePackages.breeze
    libsForQt5.breeze-qt5
    kdePackages.breeze-icons
    libsForQt5.breeze-icons
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };
}
