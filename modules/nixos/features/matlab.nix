{  pkgs, inputs, ...}:
{

  nixpkgs.overlays = [] ++ [ inputs.nix-matlab.overlay ];

  environment.systemPackages = with pkgs; [
    matlab
  ];

}
