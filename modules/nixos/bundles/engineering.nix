# Software that I use for various EE tasks
{ pkgs, pkgs-stable, ... }:
let 
  stable-pkgs = with pkgs-stable; [
    # kicad - try installing kicad from flatpak for now?
  ];
in
{

  environment.systemPackages = with pkgs;[
    qalculate-qt
    qucs-s
    ngspice
    xyce

    xournalpp

    (octaveFull.withPackages (ps: with ps; [
      symbolic
      control
    ]))
  ] ++ stable-pkgs;

}
