{ ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "custom";

      # TODO: port to new color scheme system
      themes.custom = {
        fg = "#D3C6AA";
        bg = "#272E33";
        black = "#414b50";
        red = "#e67e80";
        green = "#a7c080";
        yellow = "#dbbc7f";
        blue = "#7fbbb3";
        magenta = "#d699b6";
        cyan = "#83c092";
        white = "#d3c6aa";
        orange = "#e69875";
      };
    };
  };
}
