{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    # Process/system monitors
    gtop
    htop

    # CLI tools for Neovim
    fzf
    fd
    ripgrep
    clang
    neovide

    # Git
    git
    gh

    # Other CLI tools
    fastfetch
    zellij
    eza
    bat

    # nice to have a scripting language
    python312
    chromium
    unrar
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.lazygit = {
    enable = true;
  };

  programs.nh = {
    enable = true;
  };

  programs.fish.enable = true;

  programs.firefox = {
    enable = true;
  };

  myNixOS = {
    fish.enable = true;
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  services.flatpak.enable = true;
}
