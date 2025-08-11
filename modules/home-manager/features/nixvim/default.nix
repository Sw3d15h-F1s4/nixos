{ config, lib, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./options.nix
    ./plugins.nix
    ./keymaps.nix
    ./autocmd.nix
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    viAlias = true;

    enableMan = true;

    clipboard.providers.wl-copy.enable = true;
  };
}
