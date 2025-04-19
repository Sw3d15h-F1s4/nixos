{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "${./wallpaper.png}";
      wallpaper = ", ${./wallpaper.png}";
    };
  };
}
