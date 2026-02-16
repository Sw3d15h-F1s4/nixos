# Miscellaneous desktop-oriented graphical software.
{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    (discord.override {
      withVencord = true;
    })
    vesktop

    prismlauncher

    (bottles.override {
      removeWarningPopup = true;
    })

    thunderbird-latest

    qalculate-gtk

    bitwarden-desktop

    neovide
  ];

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  programs.firefox = {
    enable = true;
  };

  services.flatpak.enable = true;

}
