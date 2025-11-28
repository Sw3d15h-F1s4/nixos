# Miscellaneous desktop-oriented graphical software.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (discord.override {
      withVencord = true;
    })
    vesktop
    prismlauncher

    bottles

    thunderbird-latest

    qalculate-gtk

    bitwarden-desktop
  ];

  hardware.i2c = {
    enable = true;
  };

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

}
