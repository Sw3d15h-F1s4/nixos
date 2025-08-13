{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.everforest-gtk-theme;
      name = "Everforest-Dark-B-LB";
    };

    iconTheme = {
      package = pkgs.everforest-gtk-theme;
      name = "Everforest-Dark";
    };

    font = {
      name = "Sans";
      size = 11;
    };

    # h-m pr 7073 workaround for plasma writing to gtkrc :(
    gtk2.force = true;
  };

  qt = {
    enable = true;
    style = {
      package = pkgs.adwaita-qt;
    };
  };
}
