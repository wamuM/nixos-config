{ inputs, config, pkgs, lib, ... }:
{
  networking.hosts = {
        "10.22.2.1" = ["pronaos.adyton.wamu-m.com"];
        "10.22.1.4" = ["vault.adyton.wamu-m.com"];
  }; 
  services.tailscale.enable = true;
  services.printing.enable = true;
  hardware.bluetooth.enable = true;
}  
