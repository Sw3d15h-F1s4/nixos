{ ... }:
{
  myNixOS = {
    bluetooth.enable = true;
    grub.enable = true;
    nix.enable = true;
    locale.enable = true;
    udev-rules.enable = true;
    qemu.enable = true;
    hp-printer.enable = true;

    bundles.users.enable = true;
  };
}
