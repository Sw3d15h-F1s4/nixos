{inputs}: let
  lib = inputs.nixpkgs.lib;
in rec {

  # converters from Misterio77/nix-colors
  hexToDecMap = {
    "0" = 0;
    "1" = 1;
    "2" = 2;
    "3" = 3;
    "4" = 4;
    "5" = 5;
    "6" = 6;
    "7" = 7;
    "8" = 8;
    "9" = 9;
    "a" = 10;
    "b" = 11;
    "c" = 12;
    "d" = 13;
    "e" = 14;
    "f" = 15;
  };

  pow = base: exponent:
    if exponent > 1 then
      let
        x = pow base (exponent / 2);
        odd_exp = lib.mod exponent 2 == 1;
      in
      x * x * (if odd_exp then base else 1)
    else if exponent == 1 then
      base
    else if exponent == 0 && base == 0 then
      throw "undefined"
    else if exponent == 0 then
      1
    else
      throw "undefined";

  base16To10 = exponent: scalar: scalar * pow 16 exponent;

  hexCharToDec = hex:
      if builtins.stringLength hex != 1 then
        throw "Function only accepts a single character."
      else if hexToDecMap ? ${lib.toLower hex} then
        hexToDecMap."${lib.toLower hex}"
      else
        throw "Character ${hex} is not a hexadecimal value.";

  hexToDec = hex:
    let
      decimals = builtins.map hexCharToDec (lib.stringToCharacters hex);
      decimalsAscending = lib.reverseList decimals;
      decimalsPowered = lib.imap0 base16To10 decimalsAscending;
    in
    lib.foldl builtins.add 0 decimalsPowered;

  hexToRGB = hex:
    let
      rgbStartIndex = [ 0 2 4 ];
      hexList = builtins.map (x: builtins.substring x 2 hex) rgbStartIndex;
      hexLength = builtins.stringLength hex;
    in
    if hexLength != 6 then
      throw ''
        Unsupported hex string length of ${builtins.toString hexLength}.
        Length must be exactly 6.
      ''
    else
      builtins.map hexToDec hexList;

  hexToRGBA = hex:
    let
      rgbStartIndex = [ 0 2 4 6 ];
      hexList = builtins.map (x: builtins.substring x 2 hex) rgbStartIndex;
      hexLength = builtins.stringLength hex;
    in
    if hexLength != 8 then
      throw ''
        Unsupported hex string length of ${builtins.toString hexLength}.
        Length must be exactly 6.
      ''
    else
      builtins.map hexToDec hexList;

  #add the hashtag on to a hex color
  hex = string: "#" + toString string;

  #add an alpha value (either before or after)
  rgba = string: alpha: hex (string + toString alpha);
  argb = string: alpha: hex (toString alpha + string);
  
  #convert RGB hex color code
  hex2css = hex: "rgb(" + (builtins.concatStringsSep ", " (map toString (hexToRGB hex))) + ")";
  hex2cssa = hex: "rgba(" + (builtins.concatStringsSep ", " (map toString (hexToRGBA hex))) + ")";
}
