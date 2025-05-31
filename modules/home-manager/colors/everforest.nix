{ ... }:
{
  myHomeManager.colors = {
    pallete-name = "everforest-dark";
    pallete-variant = "medium";


    # high contrast
    # c1 = "1e2326";
    # c2 = "272e33";
    # c3 = "2d383c";
    # c4 = "374145";
    # c5 = "414b50";
    # c6 = "495156";
    # c7 = "4f5b58";
    # c8 = "4c3743";
    # c9 = "493b40";
    # c10 = "3c4841";
    # c11 = "384b55";
    # c12 = "45443c";

    # low contrast 
    # c1 = "293136";
    # c2 = "333c43";
    # c3 = "3a464c";
    # c4 = "434F55";
    # c5 = "4d5960";
    # c6 = "555f66";
    # c7 = "5d6B66";
    # c8 = "5c3f4f";
    # c9 = "59464c";
    # c10 = "48584e";
    # c11 = "3f5865";
    # c12 = "55544a";

      bg_dim = "232A2E";
      bg0 = "2D353B";
      bg1 = "343F44";
      bg2 = "3D484D";
      bg3 = "475258";
      bg4 = "4f585e";
      bg5 = "56635f";
      bg_purple = "543a48";
      bg_red = "514045";
      bg_green = "425047";
      bg_blue = "3a515d";
      bg_yellow = "4d4c43";
      text = "d3c6aa";
      red = "e67e80";
      orange = "e69875";
      yellow = "dbbc7f";
      green = "a7c080";
      cyan = "83c092";
      blue = "74bbb3";
      purple = "d699b6";
      darkgray = "7a8478";
      gray = "859289";
      lightgray = "9da9a0";
      black =   "414b50";
      brblack =   "475258";
  };

  programs.nixvim.colorschemes.everforest = {
    enable = true;
    settings = {
      background = "medium";
      enable_italic = 1;
      dim_inactive_windows = 1;
      transparent_background = 1;
    };
  };

  myHomeManager = {
    colors.main.enable = true;
  };
}

