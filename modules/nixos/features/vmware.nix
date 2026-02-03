{ pkgs, ... }:
{

  virtualisation.vmware.host.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
      distrobox
  ];

}
