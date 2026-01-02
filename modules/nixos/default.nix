{ config, lib, inputs, mylib, ... }:
let
  cfg = config.myNixOS;

  # Takes all modules in ./features and adds config.myNixOS.(name).enable to them
  features =
    mylib.extendModules
    (name: {
      extraOptions = {
        myNixOS.${name}.enable = lib.mkEnableOption "enable the ${name} configuration";
      };

      configExtension = config: (lib.mkIf cfg.${name}.enable config);
    })
    (mylib.filesIn ./features);

  # Takes all modules in ./bundles and adds bundle.enable to them
  bundles =
    mylib.extendModules
    (name: {
      extraOptions = {
        myNixOS.bundles.${name}.enable = lib.mkEnableOption "enable the ${name} module bundle";
      };

      configExtension = config: (lib.mkIf cfg.bundles.${name}.enable config);
    })
    (mylib.filesIn ./bundles);

  services =
    mylib.extendModules
    ( name: {
      extraOptions = {
        myNixOS.services.${name}.enable = lib.mkEnableOption "enable the ${name} service";
      };
      configExtension = config: (lib.mkIf cfg.services.${name}.enable config);
    })
    (mylib.filesIn ./services);

in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ] ++ features ++ bundles ++ services;


  config = {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "23.11";
  };

}
