{
  lib,
  config,
  inputs,
  outputs,
  mylib,
  ...
}:
{
  options.myNixOS.home-users = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      options = {
        userConfig = lib.mkOption {
          default = ../../../users/sam/home.nix;
        };
        userSettings = lib.mkOption {
          default = {};
        };
      };
    });
    default = {};
  };

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
        inherit mylib;
        outputs = inputs.self.outputs;
      };

      users =
        builtins.mapAttrs (name: user: {...}: {
          imports = [
            (import user.userConfig)
            outputs.homeManagerModules.default
          ];
        })
        (config.myNixOS.home-users);

      backupFileExtension = "HM_BKUP";
    };

    users.users = builtins.mapAttrs (
      name: user:
        {
          isNormalUser = true;
          initialPassword = "12345";
          description = "";
          extraGroups = ["networkmanager" "wheel" "libvirtd"];
        }
        // user.userSettings
    ) (config.myNixOS.home-users);
  };
}
