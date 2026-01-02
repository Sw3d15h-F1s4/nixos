{ pkgs, config, ...}:
{

  environment.systemPackages = with pkgs; [
    spice
    win-spice
    virtio-win
  ];

  programs.virt-manager.enable = true;

  virtualisation= {
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;

      onBoot = "ignore";
      onShutdown = "suspend";

      qemu = {
        package = pkgs.qemu_kvm;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        swtpm.enable = true;
        runAsRoot = false;
      };
    };
  };

  environment.etc = {
    "ovmf/edk2-x86_64-secure-code.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
    };

    "ovmf/edk2-i386-vars.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-i386-vars.fd";
    };
  };

}
