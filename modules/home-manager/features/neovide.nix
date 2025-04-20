{ ... }:
{
  programs.neovide = {
    enable = true;
    settings = {
      # nothing useful here
    };
  };

  programs.nixvim = {
    extraConfigLuaPost = ''
      if vim.g.neovide then
        vim.g.everforest_transparent_background = 0
        vim.cmd("colorscheme everforest")
      end
    '';
  };

  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "opacity 0.8, class:neovide"
    ];
  };

}
