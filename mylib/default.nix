{inputs}: let
  mylib = (import ./default.nix) {inherit inputs;};
  outputs = inputs.self.outputs;
  system = "x86_64-linux";
  pkgs-stable = import inputs.nixpkgs-stable { inherit system; config.allowUnfree = true;};
in rec {

  # Library helper functions adapted from Goxore/nixconf

  # Get the packages for a specific system (ex. "x86_64-linux")
  pkgsFor = sys: inputs.nixpkgs.legacyPackages.${sys};

  # Create a NixOS configuration
  mkSystem = config:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs outputs mylib pkgs-stable;
      };
      modules = [
        config
        outputs.nixosModules.default
      ];
    };

  # Create a home-manager configuration
  mkHome = config: hostconfig:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsFor system;
      extraSpecialArgs = {
        inherit inputs outputs mylib;
      };
      modules = [
        config
        outputs.homeManagerModules.default
        hostconfig
      ];
    };


  # Get all files in a directory as a list.
  filesIn = dir: (map (fname: dir + "/${fname}")
    (builtins.attrNames (builtins.readDir dir)));

  # Get all directories in a directory, using a filter.
  dirsIn = dir:
    inputs.nixpkgs.lib.filterAttrs (name: value: value == "directory")
    (builtins.readDir dir);

  # Get the name of the file from the path
  fileNameOf = path: (builtins.head (builtins.split "\\." (baseNameOf path)));

  extendModule = {path, ...} @ args: {pkgs, ...} @ margs: let
    eval = 
      if (builtins.isString path) || (builtins.isPath path)
      then import path margs
      else path margs;
    evalNoImports = builtins.removeAttrs eval ["imports" "options"];

    extra = 
      if (builtins.hasAttr "extraOptions" args) || (builtins.hasAttr "extraConfig" args)
      then [
        ({...}: {
          options = args.extraOptions or {};
          config = args.extraConfig or {};
        })
      ]
      else [];
    in {
      imports = 
        (eval.imports or []) ++ extra;

      options = 
        if builtins.hasAttr "optionsExtension" args
        then (args.optionsExtension (eval.options or {}))
        else (eval.options or {});

      config =
        if builtins.hasAttr "configExtension" args
        then (args.configExtension (eval.config or evalNoImports))
        else (eval.config or evalNoImports);
          };

  extendModules = extension: modules:
    map
    (f: let
      name = fileNameOf f;
    in (extendModule ((extension name) // {path = f;})))
    modules;

  # forAllSystems = pkgs:
  #   inputs.nixpkgs.lib.genAttrs [
  #     "x86_64-linux"
  #     #"aarch64-linux"
  #     #"x86_64-darwin"
  #     #"aarch64-darwin"
  #     # I don't use the other systems.
  #   ]
  #   (system: pkgs inputs.nixpkgs.legacyPackages.${system});

}
