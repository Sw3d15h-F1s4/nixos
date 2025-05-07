# Miscellaneous desktop-oriented graphical software.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    vesktop
    prismlauncher

    bottles

    thunderbird-latest

    qalculate-gtk

    bitwarden-desktop
  ];


}
