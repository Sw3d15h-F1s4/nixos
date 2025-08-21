{ pkgs, ... }:
let
  wlogout-icons = pkgs.stdenvNoCC.mkDerivation {
    name = "wlogout-icons";
    src = ./wlogout-icons;
    dontUnpack = true;
    installPhase = ''
      mkdir $out
      cp $src/*.png $out/
    '';
  };
in
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "uwsm stop";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        keybind = "r";
      }
      {
        label = "suspend";
        action = "systemctl sleep";
        keybind = "x";
      }
    ];


    style = ''
      * {
        background-image: none;
        box-shadow: none;
      }

      window {
        background-color: rgba(35, 42, 46, 0.5);
      }

      button {
        border-radius: 20;
        border-color: rgba(211,198,170,0.2);
        color: rgba(242,243,244,0.75);
        background-color: rgba(41,49,54,0.9);
        border-style: solid;
        border-width: 1px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        margin-left: 800;
        margin-right: 800;
        padding-top: 20;
        padding-bottom: 20;
      }

      button:focus, button:active, button:hover {
        border-color: rgba(131, 192, 146, 1);
        outline-style: none;
      }

      #lock {
         background-image: image(url("${wlogout-icons}/lock.png"), url("${wlogout-icons}/lock.png"));
      }

      #logout {
         background-image: image(url("${wlogout-icons}/logout.png"), url("${wlogout-icons}/logout.png"));
      }

      #suspend {
         background-image: image(url("${wlogout-icons}/suspend.png"), url("${wlogout-icons}/suspend.png"));
      }

      #hibernate {
         background-image: image(url("${wlogout-icons}/hibernate.png"), url("${wlogout-icons}/hibernate.png"));
      }

      #shutdown {
         background-image: image(url("${wlogout-icons}/shutdown.png"), url("${wlogout-icons}/shutdown.png"));
      }

      #reboot {
         background-image: image(url("${wlogout-icons}/reboot.png"), url("${wlogout-icons}/reboot.png"));
      }
    '';
  };

  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod SHIFT, M, exec, wlogout -b 1 -r 40"
    ];
  };
}
