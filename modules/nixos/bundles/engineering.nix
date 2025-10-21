# Software that I use for various EE tasks
{ pkgs, pkgs-stable, ... }:
let 
  stable-pkgs = with pkgs-stable; [
    xyce
  ];
in
{

  environment.systemPackages = with pkgs;[
    tectonic
    qucs-s
    ngspice

    (octaveFull.withPackages (ps: with ps; [
      symbolic
      control
      signal
    ]))
  ] ++ stable-pkgs;

}
