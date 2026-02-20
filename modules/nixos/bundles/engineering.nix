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
    citations

    (octaveFull.withPackages (ps: with ps; [
      symbolic
      control
      signal
    ]))
  ] ++ stable-pkgs;

  # Stable places to point qucs-s to.
  environment.etc = {
    "qucs/ngspice".source     = "${pkgs.ngspice}/bin/ngspice";
    "qucs/Xyce".source        = "${pkgs.xyce}/bin/Xyce";
    "qucs/qucsator_rf".source = "${pkgs.qucsator-rf}/bin/qucsator_rf";
  };

}
