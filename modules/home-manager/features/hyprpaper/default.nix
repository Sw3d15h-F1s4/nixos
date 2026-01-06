{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = {
        monitor = "";
        path = "${./wallpaper.png}";
      };
    };
  };
}
