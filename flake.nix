{
  description = "Sam's NixOS Config";

  inputs = {

    # Main package source. Stick to unstable for a "rolling release" style.
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };

    nixpkgs-stable = {
      url = "nixpkgs/nixos-24.05";
    };

    # Home manager version. Stick to main branch to follow unstable nixpkgs.
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Imports a flake for the anime games.
    aagl = {
     url = "github:ezKEa/aagl-gtk-on-nix";
     inputs.nixpkgs.follows = "nixpkgs";
    };

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
      sam = mkHome "x86_64-linux" ./users/sam/home.nix;
    };

    homeManagerModules.default = ./modules/home-manager;
    nixosModules.default = ./modules/nixos;
  };
}
