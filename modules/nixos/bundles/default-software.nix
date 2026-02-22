{ pkgs, inputs, ... }:
{

  environment.systemPackages = with pkgs; [
    # Process/system monitors
    htop

    # CLI tools for Neovim
    # fzf
    # fd
    # ripgrep
    # clang

    # Git
    git
    gh

    # Other CLI tools
    fastfetch
    zellij
    eza
    bat
    yazi
    unrar
    unzip

    # nice to have a scripting language
    python312

    inputs.nvf.packages.x86_64-linux.default
    nano
  ];

  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   viAlias = true;
  #   vimAlias = true;
  # };

  programs.lazygit = {
    enable = true;
  };

  programs.nh = {
    enable = true;
  };

  myNixOS = {
    fish.enable = true;
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

}
