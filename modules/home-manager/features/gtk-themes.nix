{ pkgs, ... }:
let everforest-pkg =
    pkgs.everforest-gtk-theme.overrideAttrs (oldAttrs: {
      installPhase = ''
      runHook preInstall
      mkdir -p "$out/share/"{themes,icons}
      cp -a icons/* "$out/share/icons/"
      bash themes/install.sh -d "$out/share/themes" -c dark -n Everforest
      runHook postInstall
      '';
      buildInputs = oldAttrs.buildInputs ++ [pkgs.sassc];
      dontFixup = true;
  });
in
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
      package = everforest-pkg;
      name = "Everforest-Dark";
    };

    iconTheme = {
      package = everforest-pkg;
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
