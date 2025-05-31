{ config, lib, mylib, ... }:
let
  cfg = config.myHomeManager;

  # Takes all modules in ./features and adds config.myNixOS.(name).enable to them
  features =
    mylib.extendModules
    (name: {
      extraOptions = {
        myHomeManager.${name}.enable = lib.mkEnableOption "enable my ${name} home configuration";
      };

      configExtension = config: (lib.mkIf cfg.${name}.enable config);
    })
    (mylib.filesIn ./features);

  # Takes all modules in ./bundles and adds bundle.enable to them
  bundles =
    mylib.extendModules
    (name: {
      extraOptions = {
        myHomeManager.bundles.${name}.enable = lib.mkEnableOption "enable the ${name} home module bundle";
      };

      configExtension = config: (lib.mkIf cfg.bundles.${name}.enable config);
    })
    (mylib.filesIn ./bundles);

  colors = 
    mylib.extendModules
    (name: {
      extraOptions = {
        myHomeManager.colors.${name}.enable = lib.mkEnableOption "enable the ${name} colorscheme module";
      };

      configExtension = config: (lib.mkIf cfg.colors.${name}.enable config);
    })
    (mylib.filesIn ./colors);

in {
  imports = [
  ] ++ features ++ bundles ++ colors;
}
