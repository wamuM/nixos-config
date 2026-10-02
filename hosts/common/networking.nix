{ inputs, config, pkgs, lib, ... }:
{
  networking.networkmanager.enable = true;

  networking.hosts = {
        "10.22.2.1" = ["pronaos.adyton.wamu-m.com"];
        "10.22.1.4" = ["vault.adyton.wamu-m.com"];
  }; 

  services.printing.enable = true;
  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    openfortivpn
  ];
}  
