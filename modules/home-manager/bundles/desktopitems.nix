{ pkgs, ... }:
{

  xdg.desktopEntries = {
    # "net.lutris.Lutris" = {
    #   name = "Lutris";
    #   comment = "Video Game Preservation Platform";
    #   categories = ["Game"];
    #   exec = "steam-run lutris %U";
    #   icon = "net.lutris.Lutris";
    #   terminal = false;
    #   type = "Application";
    #   startupNotify = true;
    #   mimeType = ["x-scheme-handler/lutris"];
    #   settings = {
    #     Keywords = "gaming;wine;emulator";
    #     StartupWMClass = "Lutris";
    #     X-GNOME-UsesNotifications="true";
    #   };
    # };

    matlab = {
      name = "Matlab";
      exec = "env XDG_CURRENT_DESKTOP=GNOME GTK_THEME=Adwaita:light ${pkgs.matlab}/bin/matlab -desktop %F";
      icon = "matlab";
      mimeType = ["text/x-octave" "text/x-matlab"];
      type = "Application";
      settings = {
        Keywords = "science;math;matrix;numerical computation;plotting";
        Version = "1.4";
      };
    };
  };

}
