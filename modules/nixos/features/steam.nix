{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    mangohud
    protonplus
    protontricks

    (lutris.override {
      extraPkgs = p: [
        p.wineWowPackages.full
        p.winetricks
      ];
    })

    r2modman

    # dependencies for steamtinkerlaunch
    steamtinkerlaunch
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.gamescope = {
    enable = true;
  };

  programs.gamemode.enable = true;

  #TODO: don't have a hardcoded path!
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/sam/.steam/root/compatibilitytools.d";
  };

}
