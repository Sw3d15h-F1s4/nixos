{ lib, ... }:
# i've always found base16 to be too few colors. this lets me have as many as i want.
# although, this likely will be more of a pain in the ass later.
let
  mkColor = lib.mkOption {
    type = lib.types.str;
    default = "000000";
    description = "A hex string RGB color value.";
  };
in
{

  options.myHomeManager.colors = {
    pallete-name = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Name of active color pallete. Mainly for reference.";
    };

    pallete-variant = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Variant of the active color pallete. Can be blank.";
    };


    bg_dim = mkColor;
    bg0 = mkColor;
    bg1 = mkColor;
    bg2 = mkColor;
    bg3 = mkColor;
    bg4 = mkColor;
    bg5 = mkColor;
    bg_red = mkColor;
    bg_green = mkColor;
    bg_blue = mkColor;
    bg_yellow = mkColor;
    bg_purple = mkColor;
    text = mkColor;

    red = mkColor;
    orange = mkColor;
    yellow = mkColor;
    green = mkColor;
    cyan = mkColor;
    blue = mkColor;
    purple = mkColor;

    br_red = mkColor;
    br_orange = mkColor;
    br_yellow = mkColor;
    br_green = mkColor;
    br_cyan = mkColor;
    br_blue = mkColor;
    br_purple = mkColor;

    white = mkColor;
    br_white = mkColor;

    darkgray = mkColor;
    lightgray = mkColor;
    gray = mkColor;
    black = mkColor;
    brblack = mkColor;
  };

}
