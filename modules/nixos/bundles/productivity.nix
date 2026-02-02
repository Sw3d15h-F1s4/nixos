# Contains office software, editing software, etc.
{ pkgs, pkgs-stable, ... }:
{

  environment.systemPackages = with pkgs;[
    onlyoffice-desktopeditors
    krita
    gimp3
    inkscape
    obs-studio
    pkgs-stable.kdePackages.kdenlive
  ];

}
