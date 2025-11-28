# Contains office software, editing software, etc.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    onlyoffice-desktopeditors
    # libreoffice-qt6-fresh
    krita
    gimp3
    inkscape
    obs-studio
    kdePackages.kdenlive
  ];

}
