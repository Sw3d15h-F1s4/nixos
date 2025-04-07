{ ... }:
{
  programs.wofi = {
    enable = true;

    style = builtins.readFile ./style.css;

    settings = {
      width = "40%";
      lines = 11;
      hide_scroll = true;
      allow_images = true;
      image_size = 25;
      prompt = "Search...";
      normal_window = false;
      matching = "fuzzy";
      insensitive = true;
      columns = 2;
    };
  };
}
