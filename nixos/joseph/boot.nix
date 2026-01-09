{ inputs, config, pkgs, ... }:
{
  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-544d2698-4af2-4550-b08e-a19140cc0e4c".device = "/dev/disk/by-uuid/544d2698-4af2-4550-b08e-a19140cc0e4c";
}
