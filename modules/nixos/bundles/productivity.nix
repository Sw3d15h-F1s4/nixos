# Contains office software, editing software, etc.
{ pkgs, ... }:
{

  environment.systemPackages = with pkgs;[
    onlyoffice-desktopeditors
    krita
    gimp3
    inkscape
    obs-studio
    kdePackages.kdenlive
  ];

}
