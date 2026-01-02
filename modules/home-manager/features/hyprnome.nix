{ pkgs, ...}:
{

  home.packages = with pkgs; [
    hyprnome
  ];


  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "$mod, tab, exec, hyprnome"
        "$mod SHIFT, tab, exec, hyprnome --previous"
        "ALT, tab, exec, hyprnome --move"
        "ALT SHIFT, tab, exec, hyprnome --previous --move"
      ];
    };
  };

}
