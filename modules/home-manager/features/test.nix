{ config, lib, ... }:
let 
    cfg = config.myHomeManager.test;
in {

  options.myHomeManager.test = {

    option1 = lib.mkOption {
      type = lib.types.str;
      default = "default";
      description = ''
        example option
      '';
    };

    option2 = lib.mkOption {
      type = lib.types.str;
      default = "default";
      description = ''
        example option
      '';
    };
  };

  config.myHomeManager.test.option1 = "override";


  # config.myHomeManager.test = {enable = true; option2 = "written";};

}
