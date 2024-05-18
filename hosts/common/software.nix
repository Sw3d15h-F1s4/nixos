{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # neovim
    xclip
    ripgrep
    fd
    fzf

    # cli tools
    clang
    lf
    htop
    git
    gh
    fastfetch
    zellij
    gtop
    lazygit

    # for steam
    mangohud
    protonup
    protontricks


    # default desktop apps
    firefox
    mupdf

    # nix dev helpers
    nh
    nil
    alejandra
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatibilitytools.d";

  };

  programs.gamemode.enable = true;

  programs.fish.enable = true;

}
