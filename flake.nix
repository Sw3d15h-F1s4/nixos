{
  description = "Sam's NixOS Config";

  inputs = {

    # Main package source. Stick to unstable for a "rolling release" style.
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };

    # Stable packages, mainly to avoid rebuilds on big packages that don't need updates.
    nixpkgs-stable = {
      url = "nixpkgs/nixos-24.11";
    };

    # Home manager version. Stick to main branch to follow unstable nixpkgs.
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Manages neovim through home-manager modules
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # For installing MATLAB if required.
    nix-matlab = {
      url = "gitlab:doronbehar/nix-matlab";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { ... } @ inputs:
  let
    mylib = import ./mylib/default.nix {inherit inputs;};
  in 
   with mylib; {
    nixosConfigurations = {
      desktop = mkSystem ./hosts/desktop/configuration.nix;
      laptop = mkSystem ./hosts/laptop/configuration.nix;
    };

    homeConfigurations = {
      "sam@desktop" = mkHome ./users/sam/home.nix ./hosts/desktop/home.nix;
      "sam@laptop"  = mkHome ./users/sam/home.nix ./hosts/laptop/home.nix;
    };

    homeManagerModules.default = ./modules/home-manager;
    nixosModules.default = ./modules/nixos;
  };
}
