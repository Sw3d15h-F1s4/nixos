{ inputs, ...}:
{
    imports = [inputs.aagl.nixosModules.default];
    nix.settings = inputs.aagl.nixConfig;

    programs.anime-game-launcher.enable = true;
    programs.honkers-railway-launcher.enable = true;
    programs.honkers-launcher.enable = true;
  # a real shame that kuro just hates linux ig...
  #    programs.wavey-launcher.enable = true;
  #    programs.anime-borb-launcher.enable = true
    programs.sleepy-launcher.enable = true;
}
